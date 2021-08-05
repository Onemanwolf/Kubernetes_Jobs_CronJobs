################## JOBS DEMO  #############################

#You can run the example with this command:
kubectl apply -f https://kubernetes.io/examples/controllers/job.yaml




#You can check the status with this with kubectl describe :
kubectl describe jobs/pi

#To list all the Pods that belong to a job, use a command like:
$pods=$(kubectl get pods --selector=job-name=pi --output=jsonpath='{.items[*].metadata.name}')
echo $pods

#View the standard output of one of the pods:
kubectl logs $pods

################## CRONJOB DEMO #############################


# Create a cronjob that runs a command once every minute:
kubectl apply -f cronjob.yaml

# Check the status of the cronjob:
kubectl get all

# You can get a more detailed description of the cronjob with:
kubectl get  cronjob.batch/hello -o wide

# You can also use describe:
kubectl describe cronjob.batch/hello


#View logs of cronjob:
kubectl get Jobs -w

# Get one of the job runs pod logs has to be in the history of the cronjob :

# Default history limit is 3, you can change it with:
kubectl edit cronjob.batch/hello



kubectl logs hello-1628189160-jrl2j  #relace pod name with your pod name



# We can watch the status of the cronjob with:
kubectl get  cronjob.batch/hello -o wide
# We can also watch the logs of the cronjob with
kubectl get jobs --watch



# Clean up the cronjob:
kubectl delete cronjob hello



# CronJobs was promoted to general availability in Kubernetes v1.21. If you are using an older version of Kubernetes, please refer
# to the documentation for the version of Kubernetes that you are using, so that you see accurate information. Older Kubernetes
# versions do not support the batch/v1 CronJob API.

# You can use a CronJob to run Jobs on a time-based schedule.
# These automated jobs run like Cron tasks on a Linux or UNIX system.

# Cron jobs are useful for creating periodic and recurring tasks, like running backups or sending emails.
# Cron jobs can also schedule individual tasks for a specific time, such as if you want to schedule a job for a low activity period.

# Cron jobs have limitations and idiosyncrasies. For example, in certain circumstances, a single cron job can create multiple jobs.
# Therefore, jobs should be idempotent.

### need to check the version of the api
kubectl apply -f .\cronjobbatchv1.yaml