Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3ADB353A95F
	for <lists+linux-watchdog@lfdr.de>; Wed,  1 Jun 2022 16:49:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343791AbiFAOtU (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 1 Jun 2022 10:49:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233844AbiFAOtT (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 1 Jun 2022 10:49:19 -0400
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 202275DBFA
        for <linux-watchdog@vger.kernel.org>; Wed,  1 Jun 2022 07:49:17 -0700 (PDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 251EhUFm009173;
        Wed, 1 Jun 2022 14:48:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=4Ny9KcfRwVYxM7o8qmu+uoKD0DAAOBfHfK4TqDJUIcw=;
 b=nCuhzWWlVsg3MnZUeG2we93neOuh/R/Y8cqopsY5VbBwvA3ST6t71pc9tMJIf+sDv+sD
 Fz5H8YP+mLDFTL7ymeBwQfEsiLSLQMtTVY07VgYJcw242F4C8DydsezA7mn6k4gns1kH
 CGD9ND6Jmk+rxzNoIkRCyUdGovq3J7ga0VhlFt2m0tsiQblQraMlEUfToAVMo9I869S7
 hdOkfK4cpg4gXOpjnpu1pEs8jaz9thRuMPm+vIV1VM8akeB1BfqKtEK7udBIZ4X5/bkN
 x6fYg3r2Q5r9P6XXTrC3RrcL64alFss+4ayT0ULB7+YZvZjRvJNS8dAc8XGoMlbHc2H5 jA== 
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gea4d86by-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 01 Jun 2022 14:48:55 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
        by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 251Ehrdw009658;
        Wed, 1 Jun 2022 14:48:55 GMT
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com [169.63.121.186])
        by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gea4d86bm-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 01 Jun 2022 14:48:54 +0000
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
        by ppma03wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 251ELqm5001504;
        Wed, 1 Jun 2022 14:48:54 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
        by ppma03wdc.us.ibm.com with ESMTP id 3gbc9vm6ej-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 01 Jun 2022 14:48:54 +0000
Received: from b03ledav002.gho.boulder.ibm.com (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
        by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 251EmrCm28115356
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 1 Jun 2022 14:48:53 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 02546136061;
        Wed,  1 Jun 2022 14:48:53 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id C42FE136060;
        Wed,  1 Jun 2022 14:48:52 +0000 (GMT)
Received: from localhost (unknown [9.41.178.126])
        by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
        Wed,  1 Jun 2022 14:48:52 +0000 (GMT)
Date:   Wed, 1 Jun 2022 09:48:52 -0500
From:   Scott Cheloha <cheloha@linux.ibm.com>
To:     Alexey Kardashevskiy <aik@ozlabs.ru>
Cc:     linux-watchdog@vger.kernel.org, linux@roeck-us.net,
        tzungbi@kernel.org, brking@linux.ibm.com, nathanl@linux.ibm.com,
        npiggin@gmail.com, vaishnavi@linux.ibm.com, wvoigt@us.ibm.com,
        linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v1 4/4] watchdog/pseries-wdt: initial support for PAPR
 H_WATCHDOG timers
Message-ID: <Ypd8VFZhgEIWbv1P@rascal-austin-ibm-com>
References: <20220520183552.33426-1-cheloha@linux.ibm.com>
 <20220520183552.33426-5-cheloha@linux.ibm.com>
 <74498c4b-7b6a-3864-1ae8-57e848a1254c@ozlabs.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <74498c4b-7b6a-3864-1ae8-57e848a1254c@ozlabs.ru>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 7GeDLk9yEyhqV6j96bGMQf43WRd-IiNX
X-Proofpoint-ORIG-GUID: TLEunO7JxnPww2PPAzyBwR9REWXkaJUt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-01_04,2022-06-01_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 adultscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 mlxlogscore=999 phishscore=0 malwarescore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206010067
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Wed, May 25, 2022 at 04:35:11PM +1000, Alexey Kardashevskiy wrote:
> 
> On 5/21/22 04:35, Scott Cheloha wrote:
> > PAPR v2.12 defines a new hypercall, H_WATCHDOG.  The hypercall permits
> > guest control of one or more virtual watchdog timers.  The timers have
> > millisecond granularity.  The guest is terminated when a timer
> > expires.
> > 
> > This patch adds a watchdog driver for these timers, "pseries-wdt".
> > 
> > pseries_wdt_probe() currently assumes the existence of only one
> > platform device and always assigns it watchdogNumber 1.  If we ever
> > expose more than one timer to userspace we will need to devise a way
> > to assign a distinct watchdogNumber to each platform device at device
> > registration time.
> 
> This one should go before 4/4 in the series for bisectability.
> 
> What is platform_device_register_simple("pseries-wdt",...) going to do
> without the driver?

This is a chicken-and-egg problem without an obvious solution.  A
device without a driver is a body without a soul.  A driver without a
device is a ghost without a machine.

... or something like that, don't quote me :)

Absent some very compelling reasoning, I would like to keep the
current order.  It feels logical to me to keep the powerpc/pseries
patches adjacent and prior to the watchdog driver patch.

> > Signed-off-by: Scott Cheloha <cheloha@linux.ibm.com>
> > ---
> >   .../watchdog/watchdog-parameters.rst          |  12 +
> >   drivers/watchdog/Kconfig                      |   8 +
> >   drivers/watchdog/Makefile                     |   1 +
> >   drivers/watchdog/pseries-wdt.c                | 337 ++++++++++++++++++
> >   4 files changed, 358 insertions(+)
> >   create mode 100644 drivers/watchdog/pseries-wdt.c
> > 
> > diff --git a/Documentation/watchdog/watchdog-parameters.rst b/Documentation/watchdog/watchdog-parameters.rst
> > index 223c99361a30..4ffe725e796c 100644
> > --- a/Documentation/watchdog/watchdog-parameters.rst
> > +++ b/Documentation/watchdog/watchdog-parameters.rst
> > @@ -425,6 +425,18 @@ pnx833x_wdt:
> >   -------------------------------------------------
> > +pseries-wdt:
> > +    action:
> > +	Action taken when watchdog expires: 1 (power off), 2 (restart),
> > +	3 (dump and restart). (default=2)
> > +    timeout:
> > +	Initial watchdog timeout in seconds. (default=60)
> > +    nowayout:
> > +	Watchdog cannot be stopped once started.
> > +	(default=kernel config parameter)
> > +
> > +-------------------------------------------------
> > +
> >   rc32434_wdt:
> >       timeout:
> >   	Watchdog timeout value, in seconds (default=20)
> > diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
> > index c4e82a8d863f..06b412603f3e 100644
> > --- a/drivers/watchdog/Kconfig
> > +++ b/drivers/watchdog/Kconfig
> > @@ -1932,6 +1932,14 @@ config MEN_A21_WDT
> >   # PPC64 Architecture
> > +config PSERIES_WDT
> > +	tristate "POWER Architecture Platform Watchdog Timer"
> > +	depends on PPC_PSERIES
> > +	select WATCHDOG_CORE
> > +	help
> > +	  Driver for virtual watchdog timers provided by PAPR
> > +	  hypervisors (e.g. PowerVM, KVM).
> > +
> >   config WATCHDOG_RTAS
> >   	tristate "RTAS watchdog"
> >   	depends on PPC_RTAS
> > diff --git a/drivers/watchdog/Makefile b/drivers/watchdog/Makefile
> > index f7da867e8782..f35660409f17 100644
> > --- a/drivers/watchdog/Makefile
> > +++ b/drivers/watchdog/Makefile
> > @@ -184,6 +184,7 @@ obj-$(CONFIG_BOOKE_WDT) += booke_wdt.o
> >   obj-$(CONFIG_MEN_A21_WDT) += mena21_wdt.o
> >   # PPC64 Architecture
> > +obj-$(CONFIG_PSERIES_WDT) += pseries-wdt.o
> >   obj-$(CONFIG_WATCHDOG_RTAS) += wdrtas.o
> >   # S390 Architecture
> > diff --git a/drivers/watchdog/pseries-wdt.c b/drivers/watchdog/pseries-wdt.c
> > new file mode 100644
> > index 000000000000..f41bc4d3b7a2
> > --- /dev/null
> > +++ b/drivers/watchdog/pseries-wdt.c
> > @@ -0,0 +1,337 @@
> > +// SPDX-License-Identifier: GPL-2.0-or-later
> > +/*
> > + * Copyright (c) 2022 International Business Machines, Inc.
> > + */
> > +
> > +#include <linux/bitops.h>
> > +#include <linux/kernel.h>
> > +#include <linux/limits.h>
> > +#include <linux/mod_devicetable.h>
> > +#include <linux/module.h>
> > +#include <linux/moduleparam.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/watchdog.h>
> > +
> > +#define DRV_NAME "pseries-wdt"
> > +
> > +/*
> > + * The PAPR's MSB->LSB bit ordering is 0->63.  These macros simplify
> > + * defining bitfields as described in the PAPR without needing to
> > + * transpose values to the more C-like 63->0 ordering.
> > + */
> > +#define SETFIELD(_v, _b, _e)	\
> > +	(((unsigned long)(_v) << PPC_BITLSHIFT(_e)) & PPC_BITMASK((_b), (_e)))
> > +#define GETFIELD(_v, _b, _e)	\
> > +	(((unsigned long)(_v) & PPC_BITMASK((_b), (_e))) >> PPC_BITLSHIFT(_e))
> > +
> > +/*
> > + * H_WATCHDOG Hypercall Input
> > + *
> > + * R4: "flags":
> > + *
> > + *     A 64-bit value structured as follows:
> > + *
> > + *         Bits 0-46: Reserved (must be zero).
> > + */
> > +#define PSERIES_WDTF_RESERVED	PPC_BITMASK(0, 46)
> > +
> > +/*
> > + *         Bit 47: "leaveOtherWatchdogsRunningOnTimeout"
> > + *
> > + *             0  Stop outstanding watchdogs on timeout.
> > + *             1  Leave outstanding watchdogs running on timeout.
> > + */
> > +#define PSERIES_WDTF_LEAVE_OTHER	PPC_BIT(47)
> > +
> > +/*
> > + *         Bits 48-55: "operation"
> > + *
> > + *             0x01  Start Watchdog
> > + *             0x02  Stop Watchdog
> > + *             0x03  Query Watchdog Capabilities
> > + *             0x04  Query Watchdog LPM Requirement
> > + */
> > +#define PSERIES_WDTF_OP(op)		SETFIELD((op), 48, 55)
> > +#define PSERIES_WDTF_OP_START		PSERIES_WDTF_OP(0x1)
> > +#define PSERIES_WDTF_OP_STOP		PSERIES_WDTF_OP(0x2)
> > +#define PSERIES_WDTF_OP_QUERY		PSERIES_WDTF_OP(0x3)
> > +#define PSERIES_WDTF_OP_QUERY_LPM	PSERIES_WDTF_OP(0x4)
> > +
> > +/*
> > + *         Bits 56-63: "timeoutAction"
> > + *
> > + *             0x01  Hard poweroff
> > + *             0x02  Hard restart
> > + *             0x03  Dump restart
> > + */
> > +#define PSERIES_WDTF_ACTION(ac)			SETFIELD(ac, 56, 63)
> > +#define PSERIES_WDTF_ACTION_HARD_POWEROFF	PSERIES_WDTF_ACTION(0x1)
> > +#define PSERIES_WDTF_ACTION_HARD_RESTART	PSERIES_WDTF_ACTION(0x2)
> > +#define PSERIES_WDTF_ACTION_DUMP_RESTART	PSERIES_WDTF_ACTION(0x3)
> 
> > +
> > +/*
> > + * R5: "watchdogNumber":
> > + *
> > + *     The target watchdog.  Watchdog numbers are 1-based.  The
> > + *     maximum supported watchdog number may be obtained via the
> > + *     "Query Watchdog Capabilities" operation.
> > + *
> > + *     This input is ignored for the "Query Watchdog Capabilities"
> > + *     operation.
> > + *
> > + * R6: "timeoutInMs":
> > + *
> > + *     The timeout in milliseconds.  The minimum supported timeout may
> > + *     be obtained via the "Query Watchdog Capabilities" operation.
> > + *
> > + *     This input is ignored for the "Stop Watchdog", "Query Watchdog
> > + *     Capabilities", and "Query Watchdog LPM Requirement" operations.
> > + */
> > +
> > +/*
> > + * H_WATCHDOG Hypercall Output
> > + *
> > + * R3: Return code
> > + *
> > + *     H_SUCCESS    The operation completed.
> > + *
> > + *     H_BUSY	    The hypervisor is too busy; retry the operation.
> > + *
> > + *     H_PARAMETER  The given "flags" are somehow invalid.  Either the
> > + *                  "operation" or "timeoutAction" is invalid, or a
> > + *                  reserved bit is set.
> > + *
> > + *     H_P2         The given "watchdogNumber" is zero or exceeds the
> > + *                  supported maximum value.
> > + *
> > + *     H_P3         The given "timeoutInMs" is below the supported
> > + *                  minimum value.
> > + *
> > + *     H_NOOP       The given "watchdogNumber" is already stopped.
> > + *
> > + *     H_HARDWARE   The operation failed for ineffable reasons.
> > + *
> > + *     H_FUNCTION   The H_WATCHDOG hypercall is not supported by this
> > + *                  hypervisor.
> > + *
> > + * R4:
> > + *
> > + * - For the "Query Watchdog Capabilities" operation, a 64-bit
> > + *   value structured as follows:
> > + *
> > + *       Bits  0-15: The minimum supported timeout in milliseconds.
> > + *       Bits 16-31: The number of watchdogs supported.
> > + *       Bits 32-63: Reserved.
> > + */
> > +#define PSERIES_WDTQ_MIN_TIMEOUT(cap)	GETFIELD((cap), 0, 15)
> > +#define PSERIES_WDTQ_MAX_NUMBER(cap)	GETFIELD((cap), 16, 31)
> > +#define PSERIES_WDTQ_RESERVED		PPC_BITMASK(32, 63)
> 
> PSERIES_WDTQ_RESERVED is not needed as there is a comment above.

The *_RESERVED macros are from your draft patch.  I will remove them,
though, we aren't actually using them.

I will trim up the big comment for v2, too.  It's just going to rot
otherwise.  You need to read the PAPR to review the hypercalls,
anyway.

> > +
> > +/*
> > + * - For the "Query Watchdog LPM Requirement" operation:
> > + *
> > + *       1  The given "watchdogNumber" must be stopped prior to
> > + *          suspending.
> > + *
> > + *       2  The given "watchdogNumber" does not have to be stopped
> > + *          prior to suspending.
> > + */
> > +#define PSERIES_WDTQL_MUST_STOP		1
> > +#define PSERIES_WDTQL_NEED_NOT_STOP	2
> > +
> > +static unsigned long action = PSERIES_WDTF_ACTION_HARD_RESTART;
> > +
> > +static int action_get(char *buf, const struct kernel_param *kp)
> > +{
> > +	int val;
> > +
> > +	switch (action) {
> > +	case PSERIES_WDTF_ACTION_HARD_POWEROFF:
> > +		val = 1;
> > +		break;
> > +	case PSERIES_WDTF_ACTION_HARD_RESTART:
> > +		val = 2;
> > +		break;
> > +	case PSERIES_WDTF_ACTION_DUMP_RESTART:
> > +		val = 3;
> > +		break;
> > +	default:
> > +		return -EINVAL;
> > +	}
> > +	return sprintf(buf, "%d\n", val);
> > +}
> > +
> > +static int action_set(const char *val, const struct kernel_param *kp)
> > +{
> > +	int choice;
> > +
> > +	if (kstrtoint(val, 10, &choice))
> > +		return -EINVAL;
> > +	switch (choice) {
> > +	case 1:
> > +		action = PSERIES_WDTF_ACTION_HARD_POWEROFF;
> > +		return 0;
> > +	case 2:
> > +		action = PSERIES_WDTF_ACTION_HARD_RESTART;
> > +		return 0;
> > +	case 3:
> > +		action = PSERIES_WDTF_ACTION_DUMP_RESTART;
> > +		return 0;
> > +	}
> > +	return -EINVAL;
> > +}
> > +
> > +static const struct kernel_param_ops action_ops = {
> > +	.get = action_get,
> > +	.set = action_set,
> > +};
> > +module_param_cb(action, &action_ops, NULL, 0444);
> 
> 0644 here and below?

I do not want these changing at runtime.  0444 is the right thing.

> > +MODULE_PARM_DESC(action, "Action taken when watchdog expires (default=2)");
> > +
> > +static bool nowayout = WATCHDOG_NOWAYOUT;
> > +module_param(nowayout, bool, 0444);
> > +MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started (default="
> > +		 __MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
> > +
> > +#define WATCHDOG_TIMEOUT 60
> > +static unsigned int timeout = WATCHDOG_TIMEOUT;
> > +module_param(timeout, uint, 0444);
> > +MODULE_PARM_DESC(timeout, "Initial watchdog timeout in seconds (default="
> > +		 __MODULE_STRING(WATCHDOG_TIMEOUT) ")");
> > +
> > +struct pseries_wdt {
> > +	struct watchdog_device wd;
> > +	unsigned long num;		/* Watchdog numbers are 1-based */
> > +};
> > +
> > +static int pseries_wdt_start(struct watchdog_device *wdd)
> > +{
> > +	struct device *dev = wdd->parent;
> > +	struct pseries_wdt *pw = watchdog_get_drvdata(wdd);
> > +	unsigned long flags, msecs;
> > +	long rc;
> > +
> > +	flags = action | PSERIES_WDTF_OP_START;
> > +	msecs = wdd->timeout * 1000UL;
> > +	rc = plpar_hcall_norets(H_WATCHDOG, flags, pw->num, msecs);
> > +	if (rc != H_SUCCESS) {
> > +		dev_crit(dev, "H_WATCHDOG: %ld: failed to start timer %lu",
> > +			 rc, pw->num);
> > +		return -EIO;
> > +	}
> > +	return 0;
> > +}
> > +
> > +static int pseries_wdt_stop(struct watchdog_device *wdd)
> > +{
> > +	struct device *dev = wdd->parent;
> > +	struct pseries_wdt *pw = watchdog_get_drvdata(wdd);
> > +	long rc;
> > +
> > +	rc = plpar_hcall_norets(H_WATCHDOG, PSERIES_WDTF_OP_STOP, pw->num);
> > +	if (rc != H_SUCCESS && rc != H_NOOP) {
> > +		dev_crit(dev, "H_WATCHDOG: %ld: failed to stop timer %lu",
> > +			 rc, pw->num);
> > +		return -EIO;
> > +	}
> > +	return 0;
> > +}
> > +
> > +static struct watchdog_info pseries_wdt_info = {
> > +	.identity = DRV_NAME,
> > +	.options = WDIOF_KEEPALIVEPING | WDIOF_MAGICCLOSE | WDIOF_SETTIMEOUT
> > +	    | WDIOF_PRETIMEOUT,
> > +};
> > +
> > +static const struct watchdog_ops pseries_wdt_ops = {
> > +	.owner = THIS_MODULE,
> > +	.start = pseries_wdt_start,
> > +	.stop = pseries_wdt_stop,
> > +};
> > +
> > +static int pseries_wdt_probe(struct platform_device *pdev)
> > +{
> > +	unsigned long ret[PLPAR_HCALL_BUFSIZE] = { 0 };
> > +	unsigned long cap, min_timeout_ms;
> > +	long rc;
> > +	struct pseries_wdt *pw;
> > +	int err;
> > +
> > +	rc = plpar_hcall(H_WATCHDOG, ret, PSERIES_WDTF_OP_QUERY);
> > +	if (rc != H_SUCCESS)
> > +		return rc == H_FUNCTION ? -ENODEV : -EIO;
> 
> Nit:
> 
> if (rc == H_FUNCTION)
> 	return -ENODEV;
> if (rc != H_SUCCESS)
> 	return -EIO;
> 
> ?

Sure, changed in v2.

> > +	cap = ret[0];
> > +
> > +	pw = devm_kzalloc(&pdev->dev, sizeof(*pw), GFP_KERNEL);
> > +	if (!pw)
> > +		return -ENOMEM;
> > +
> > +	/*
> > +	 * Assume watchdogNumber 1 for now.  If we ever support
> > +	 * multiple timers we will need to devise a way to choose a
> > +	 * distinct watchdogNumber for each platform device at device
> > +	 * registration time.
> > +	 */
> > +	pw->num = 1;
> > +
> > +	pw->wd.parent = &pdev->dev;
> > +	pw->wd.info = &pseries_wdt_info;
> > +	pw->wd.ops = &pseries_wdt_ops;
> > +	min_timeout_ms = PSERIES_WDTQ_MIN_TIMEOUT(cap);
> > +	pw->wd.min_timeout = roundup(min_timeout_ms, 1000) / 1000;
> > +	pw->wd.max_timeout = UINT_MAX;
> > +	watchdog_init_timeout(&pw->wd, timeout, NULL);
> 
> 
> If PSERIES_WDTF_OP_QUERY returns 2min and this driver's default is 1min,
> watchdog_init_timeout() returns an error, don't we want to handle it here?

Fixed in v2.

-Scott
