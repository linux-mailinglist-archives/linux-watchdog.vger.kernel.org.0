Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 13D7536A1A7
	for <lists+linux-watchdog@lfdr.de>; Sat, 24 Apr 2021 16:41:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229848AbhDXOmS (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 24 Apr 2021 10:42:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229630AbhDXOmQ (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 24 Apr 2021 10:42:16 -0400
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com [IPv6:2607:f8b0:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 626A6C061574;
        Sat, 24 Apr 2021 07:41:38 -0700 (PDT)
Received: by mail-oi1-x22f.google.com with SMTP id u16so34793327oiu.7;
        Sat, 24 Apr 2021 07:41:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=xN23ulminwziFA7mXY1KYaWWv1cLqTYFlrrmW7z+zYs=;
        b=ov4SyxdQveP+qQ1ausN/coDSihqyGNU8I2m9QR7GteExqL4grYhj3AhQCk/n4kkffe
         kZL9w5XX20vTEbuOsef9kyGwPdOvQ0ufgr+S3vksvnzUK4HTrwzgUh/sdZ5nEZar4701
         FF48Zf8leX7ijcandmvmfMMJbbOaFiqkaDIlLEoQMOxwa0TBqcnhsW0cRUNQnZljXM5X
         m0pX51irHFGxcZfs0YEhTdC1rjzZEZ3kCcyE2FCWplXj/tyomuFNrX6Z/pRFH1K9gjTH
         jJVoem61Nd4AO6dVa73CjcH4tIAm00jYGSX3j7lOUz7MV9hlStOGnh62Y0YFbcow9CZa
         OASA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=xN23ulminwziFA7mXY1KYaWWv1cLqTYFlrrmW7z+zYs=;
        b=ryd3Mw3/qUNvjTBu2KXFmoH+BLlQIMFkrPdHcOC6Vy0D29gue1BGY31Rl65ojvXPMK
         VXiKF9/8aJWX75Rspccd/lZd2+V66fNelWIkRnvS6R5OkudCXscKuFUKFZvXvHEjnXfV
         ydRYbEbpI1xaD2UCS0PbpT1mM0Rs/+gVFyo9QSncTPck8kx3u9H1vobomAWEIzq6o+7S
         yIXnfmvShcqAoIxE9mGEmm9G8BHt9dSoiFLBUgNSpIGzhWqmyQ8ujtZkliJ0aM283wls
         iHeymop7dNm6ugGg3OqaoWvovF/aBcdm2a3R0DlqIxrm/2GRQCo68ImVlHjOW2Qw2vsB
         ZF6g==
X-Gm-Message-State: AOAM532AleGwGgTna+OA/Cnb+e/6+AnvXX4nsvPjmgxW80rNfbRfeVRP
        GZJST7HPLQBocRtGcJwfUNw=
X-Google-Smtp-Source: ABdhPJxOYAFGV/eZgN+q3xOlggmeaBWpQOxIdkX0eCEsDeVZId69l1+0e2/CijNaYKn9YZ5lK+ISTQ==
X-Received: by 2002:aca:7558:: with SMTP id q85mr6407206oic.160.1619275297534;
        Sat, 24 Apr 2021 07:41:37 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id o2sm2016999oti.30.2021.04.24.07.41.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 Apr 2021 07:41:36 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [RFC PATCH] watchdog: Adding softwatchdog
To:     Peter Enderborg <peter.enderborg@sony.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, Shakeel Butt <shakeelb@google.com>
References: <20210424102555.28203-1-peter.enderborg@sony.com>
 <20210424102555.28203-2-peter.enderborg@sony.com>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <d5db5606-f074-6d0e-2316-8ff41af25cfd@roeck-us.net>
Date:   Sat, 24 Apr 2021 07:41:34 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210424102555.28203-2-peter.enderborg@sony.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 4/24/21 3:25 AM, Peter Enderborg wrote:
> This is not a rebooting watchdog. It's function is to take other
> actions than a hard reboot. On many complex system there is some
> kind of manager that monitor and take action on slow systems.
> Android has it's lowmemorykiller (lmkd), desktops has earlyoom.
> This watchdog can be used to help monitor to preform some basic
> action to keep the monitor running.
> 
> It can also be used standalone. This add a policy that is
> killing the process with highest oom_score_adj and using
> oom functions to it quickly. I think it is a good usecase
> for the patch. Memory siuations can be problematic for
> software that monitor system, but other prolicys can
> should also be possible. Like picking tasks from a memcg, or
> specific UID's or what ever is low priority.
> ---

NACK. Besides this not following the new watchdog API, the task
of a watchdog is to reset the system on failure. Its task is most
definitely not to re-implement the oom killer in any way, shape,
or form.

Guenter


>  drivers/watchdog/Makefile       |   2 +
>  drivers/watchdog/softwatchdog.c | 231 ++++++++++++++++++++++++++++++++
>  include/uapi/linux/watchdog.h   |   6 +
>  mm/oom_kill.c                   |   4 +-
>  4 files changed, 241 insertions(+), 2 deletions(-)
>  create mode 100644 drivers/watchdog/softwatchdog.c
> 
> diff --git a/drivers/watchdog/Makefile b/drivers/watchdog/Makefile
> index f3a6540e725e..bff8f61fe504 100644
> --- a/drivers/watchdog/Makefile
> +++ b/drivers/watchdog/Makefile
> @@ -221,3 +221,5 @@ obj-$(CONFIG_MENZ069_WATCHDOG) += menz69_wdt.o
>  obj-$(CONFIG_RAVE_SP_WATCHDOG) += rave-sp-wdt.o
>  obj-$(CONFIG_STPMIC1_WATCHDOG) += stpmic1_wdt.o
>  obj-$(CONFIG_SL28CPLD_WATCHDOG) += sl28cpld_wdt.o
> +
> +obj-y += softwatchdog.o
> diff --git a/drivers/watchdog/softwatchdog.c b/drivers/watchdog/softwatchdog.c
> new file mode 100644
> index 000000000000..dd7153092da8
> --- /dev/null
> +++ b/drivers/watchdog/softwatchdog.c
> @@ -0,0 +1,231 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/* Soft watchdog
> + *  This is a RFC of a watchdog does do not reboot the system.
> + *  Instead it do a pre defined action
> + *
> + *  Author: peter.enderborg@sony.com
> + */
> +
> +#include <linux/kernel.h>
> +#include <linux/mm.h>
> +#include <linux/slab.h>
> +#include <linux/oom.h>
> +#include <linux/module.h>
> +#include <linux/moduleparam.h>
> +#include <linux/types.h>
> +#include <linux/timer.h>
> +#include <linux/miscdevice.h>
> +#include <linux/watchdog.h>
> +#include <linux/notifier.h>
> +#include <linux/init.h>
> +#include <linux/fs.h>
> +
> +void wake_oom_reaper(struct task_struct *tsk); /* need to public ... */
> +void __oom_kill_process(struct task_struct *victim, const char *message); /* hmm */
> +
> +static struct timer_list swd_timer;
> +static int heartbeat = 500;
> +static unsigned long swd_is_open;
> +static char expect_close;
> +static bool nowayout = WATCHDOG_NOWAYOUT;
> +
> +/* a example policy doing a process kill by calling
> + *  functions within oom-killer.
> + */
> +static int policy_fast_kill_oom_score_adj(void)
> +{
> +	struct task_struct *tsk;
> +	struct task_struct *selected = NULL;
> +	int highest = 0;
> +
> +	rcu_read_lock();
> +	for_each_process(tsk) {
> +		struct task_struct *candidate;
> +
> +		if (tsk->flags & PF_KTHREAD)
> +			continue;
> +
> +		/* Ignore task if coredump in progress */
> +		if (tsk->mm && tsk->mm->core_state)
> +			continue;
> +		candidate = find_lock_task_mm(tsk);
> +		if (!candidate)
> +			continue;
> +
> +		if (highest < candidate->signal->oom_score_adj) {
> +			/* for test dont kill level 0 */
> +			highest = candidate->signal->oom_score_adj;
> +			selected = candidate;
> +			pr_info("new selected %d %d", selected->pid,
> +				selected->signal->oom_score_adj);
> +		}
> +		task_unlock(candidate);
> +	}
> +	if (selected)
> +		get_task_struct(selected);
> +
> +	rcu_read_unlock();
> +	if (selected) {
> +		int pid = selected->pid;
> +
> +		pr_info("swd killing: %d", selected->pid);
> +		__oom_kill_process(selected, "swd");
> +		return pid;
> +	}
> +	return 0;
> +}
> +
> +static void swd_ping(void)
> +{
> +	mod_timer(&swd_timer, jiffies + heartbeat);
> +}
> +
> +static long swd_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
> +{
> +	void __user *argp = (void __user *)arg;
> +	int __user *p = argp;
> +	int new_heartbeat;
> +	int status;
> +
> +	struct watchdog_info ident = {
> +		.options =		WDIOF_SETTIMEOUT|
> +					WDIOF_MAGICCLOSE|
> +					WDIOF_OOMKILL |
> +					WDIOF_AUTOKILL,
> +		.identity =		"swd",
> +	};
> +
> +	switch (cmd) {
> +	case WDIOC_GETSUPPORT:
> +		return copy_to_user(argp, &ident, sizeof(ident)) ? -EFAULT : 0;
> +	case WDIOC_GETSTATUS:
> +		status = 0;
> +		return put_user(status, p);
> +	case WDIOC_GETBOOTSTATUS:
> +		return put_user(0, p);
> +	case WDIOC_KEEPALIVE:
> +		swd_ping();
> +		return 0;
> +	case WDIOC_SETTIMEOUT:
> +		if (get_user(new_heartbeat, p))
> +			return -EFAULT;
> +		heartbeat = new_heartbeat;
> +		fallthrough;
> +	case WDIOC_GETTIMEOUT:
> +		return put_user(heartbeat, p);
> +	default:
> +		return -ENOTTY;
> +	}
> +	return -ENOTTY;
> +}
> +
> +static void swd_timer_func(struct timer_list *unused)
> +{
> +	int res;
> +
> +	pr_info("swd timer %d\n", heartbeat);
> +	res = policy_fast_kill_oom_score_adj();
> +	if (res)
> +		pr_info("killed %d\n", res);
> +
> +	mod_timer(&swd_timer, jiffies + heartbeat);
> +}
> +
> +static int swd_start(void)
> +{
> +	add_timer(&swd_timer);
> +	return 0;
> +}
> +
> +static int swd_stop(void)
> +{
> +	del_timer(&swd_timer);
> +	return 0;
> +}
> +
> +static int swd_open(struct inode *inode, struct file *file)
> +{
> +	if (test_and_set_bit(0, &swd_is_open))
> +		return -EBUSY;
> +	swd_start();
> +	return stream_open(inode, file);
> +}
> +
> +static int swd_release(struct inode *inode, struct file *file)
> +{
> +	if (expect_close != 42) {
> +		swd_stop();
> +		clear_bit(0, &swd_is_open);
> +	} else {
> +		pr_crit("SWD device closed unexpectedly.  SWD will not stop!\n");
> +		swd_ping();
> +	}
> +	expect_close = 0;
> +	return 0;
> +}
> +static ssize_t swd_write(struct file *file, const char __user *buf,
> +						size_t count, loff_t *ppos)
> +{
> +	if (count) {
> +		if (!nowayout) {
> +			size_t i;
> +
> +			expect_close = 0;
> +			for (i = 0; i != count; i++) {
> +				char c;
> +
> +				if (get_user(c, buf + i))
> +					return -EFAULT;
> +				if (c == 'V')
> +					expect_close = 42;
> +			}
> +		}
> +		swd_ping();
> +	}
> +	return count;
> +}
> +
> +static const struct file_operations swd_fops = {
> +	.owner		= THIS_MODULE,
> +	.llseek		= no_llseek,
> +	 .write		= swd_write,
> +	.unlocked_ioctl	= swd_ioctl,
> +	.compat_ioctl	= compat_ptr_ioctl,
> +	.open		= swd_open,
> +	.release	= swd_release,
> +};
> +
> +static struct miscdevice swd_miscdev = {
> +	.minor	=	WATCHDOG_MINOR,
> +	.name	=	"soft-watchdog",
> +	.fops	=	&swd_fops,
> +};
> +
> +int __init swd_register(void)
> +{
> +	int ret;
> +
> +	pr_info("swd installed with timer");
> +	ret = misc_register(&swd_miscdev);
> +	timer_setup(&swd_timer, swd_timer_func, 0);
> +	return 0;
> +}
> +
> +static int __init swd_init(void)
> +{
> +	return 0;
> +}
> +
> +static void __exit swd_unload(void)
> +{
> +	return;
> +}
> +
> +subsys_initcall(swd_register);
> +
> +module_init(swd_init);
> +module_exit(swd_unload);
> +
> +MODULE_AUTHOR("Peter Enderborg");
> +MODULE_DESCRIPTION("Memory software watchdog");
> +MODULE_LICENSE("GPL");
> diff --git a/include/uapi/linux/watchdog.h b/include/uapi/linux/watchdog.h
> index b15cde5c9054..780987482e2d 100644
> --- a/include/uapi/linux/watchdog.h
> +++ b/include/uapi/linux/watchdog.h
> @@ -48,6 +48,12 @@ struct watchdog_info {
>  #define	WDIOF_PRETIMEOUT	0x0200  /* Pretimeout (in seconds), get/set */
>  #define	WDIOF_ALARMONLY		0x0400	/* Watchdog triggers a management or
>  					   other external alarm not a reboot */
> +#define WDIOF_OOMKILL		0x0800	/* Watchdog trigger process kill as
> +					 *  oom kill
> +					 */
> +#define WDIOF_AUTOKILL		0x1000	/* Watchdog listen to oom notifiy
> +					 * and kills with its policy
> +					 */
>  #define	WDIOF_KEEPALIVEPING	0x8000	/* Keep alive ping reply */
>  
>  #define	WDIOS_DISABLECARD	0x0001	/* Turn off the watchdog timer */
> diff --git a/mm/oom_kill.c b/mm/oom_kill.c
> index fa1cf18bac97..a5f7299af9a3 100644
> --- a/mm/oom_kill.c
> +++ b/mm/oom_kill.c
> @@ -658,7 +658,7 @@ static int oom_reaper(void *unused)
>  	return 0;
>  }
>  
> -static void wake_oom_reaper(struct task_struct *tsk)
> +void wake_oom_reaper(struct task_struct *tsk)
>  {
>  	/* mm is already queued? */
>  	if (test_and_set_bit(MMF_OOM_REAP_QUEUED, &tsk->signal->oom_mm->flags))
> @@ -856,7 +856,7 @@ static bool task_will_free_mem(struct task_struct *task)
>  	return ret;
>  }
>  
> -static void __oom_kill_process(struct task_struct *victim, const char *message)
> +void __oom_kill_process(struct task_struct *victim, const char *message)
>  {
>  	struct task_struct *p;
>  	struct mm_struct *mm;
> 

