Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9FBA7332E70
	for <lists+linux-watchdog@lfdr.de>; Tue,  9 Mar 2021 19:43:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230491AbhCISnE (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 9 Mar 2021 13:43:04 -0500
Received: from mx0b-002e3701.pphosted.com ([148.163.143.35]:61840 "EHLO
        mx0b-002e3701.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231138AbhCISmr (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 9 Mar 2021 13:42:47 -0500
Received: from pps.filterd (m0148664.ppops.net [127.0.0.1])
        by mx0b-002e3701.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 129ISjRV026358;
        Tue, 9 Mar 2021 18:42:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pps0720; bh=JJpSDPV9oIKR7DiEGS0O7fPdz8e7a8KQD6LUhquK4Og=;
 b=HhUENPXapsd6Qo8vB5eC/aNTLORyb4qracymKkPKkCWTQnnEFmbFQhANodFY+X4SSfUH
 MzeWPH7q3ralG0TUag7o0wGJhz/wh3G3m+N0XFXfCTZaVtiCtasmUskiFGymqbJknFOJ
 r96VwK7O71yUZgZ6F5h+MwbggFULySX9FCKgX0AOnQd6g6ClpveLj9XIWyAghsJVv0es
 L4pMI/HiXOAgcwJOHMACScj7m6X5NqgGIH9Y9/b/sk9Q0SScBxX3H1f02xQWg7VnbfaA
 3h6cM5cAMt9ULql1RW/e8MHXafJSMUH25Y5RTuZ7XITOfvyWE/XJ58u7VzecjIbq1oCW tg== 
Received: from g9t5008.houston.hpe.com (g9t5008.houston.hpe.com [15.241.48.72])
        by mx0b-002e3701.pphosted.com with ESMTP id 3766ttmfcg-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 09 Mar 2021 18:42:18 +0000
Received: from g4t3433.houston.hpecorp.net (g4t3433.houston.hpecorp.net [16.208.49.245])
        by g9t5008.houston.hpe.com (Postfix) with ESMTP id B961156;
        Tue,  9 Mar 2021 18:42:17 +0000 (UTC)
Received: from anatevka.americas.hpqcorp.net (anatevka.americas.hpqcorp.net [10.33.237.3])
        by g4t3433.houston.hpecorp.net (Postfix) with ESMTP id D571D45;
        Tue,  9 Mar 2021 18:42:16 +0000 (UTC)
Date:   Tue, 9 Mar 2021 11:42:16 -0700
From:   Jerry Hoemann <jerry.hoemann@hpe.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Flavio Suligoi <f.suligoi@asem.it>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH v1 0/2] Watchdog Core Global Parameters
Message-ID: <20210309184216.GN234518@anatevka.americas.hpqcorp.net>
References: <20210308112151.716315-1-f.suligoi@asem.it>
 <d47fcc00-58fa-5850-7599-74644b34e39f@roeck-us.net>
 <984953abc23c4cd6a4a6a5b77ae72e66@asem.it>
 <1500d5fe-5228-1671-2008-4b7e30e856ea@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1500d5fe-5228-1671-2008-4b7e30e856ea@roeck-us.net>
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369,18.0.761
 definitions=2021-03-09_14:2021-03-09,2021-03-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 spamscore=0
 mlxlogscore=999 clxscore=1011 mlxscore=0 impostorscore=0 bulkscore=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103090088
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Tue, Mar 09, 2021 at 07:22:28AM -0800, Guenter Roeck wrote:
> On 3/9/21 2:26 AM, Flavio Suligoi wrote:
> > Hi Guenter,
> > 
> >>> Instead of adding this kind of module parameters independently to each
> >>> driver, the best solution is declaring each feature only once, in the
> >>> watchdog core.
> >>>
> >>
> >> I agree to and like the idea, but I don't see the point of letting drivers opt in
> >> or opt out. This adds a lot of complexity for little if any gain.
> > 
> > Do you mean that all the support for this "global parameters" should be done
> > in the watchdog-core only, without write any code in each single
> > "hardware" driver?
> 
> Correct. It should not be up to the driver author to decide if they
> want to opt out from global parameters or not. It should be up to
> users, and users can opt out by not providing the parameters.


Guenter,

What about parameters like "pretimeout"  that only some WD drivers have
hw to support?

Might be nice to centralize these parameters as well, but leaving it up
to users to decide might not make sense.

Or do you see the recent work to allow for a software pretimeout
mechanism covering this?

thanks

Jerry

> 
> Guenter
> 
> >>
> >> Guenter
> > 
> > Regards,
> > 
> > Flavio
> > 
> >>
> >>> Additionally, I added a implementation example of this "global"
> >>> parameters using the module "wdat_wdt"
> >>>
> >>> In details:
> >>>
> >>> ===============================
> >>> Watchdog Core Global Parameters
> >>> ===============================
> >>>
> >>> Information for watchdog kernel modules developers.
> >>>
> >>> Introduction
> >>> ============
> >>>
> >>> Different watchdog modules frequently require the same type of
> >>> parameters (for example: *timeout*, *nowayout* feature,
> >>> *start_enabled* to start the watchdog on module insertion, etc.).
> >>> Instead of adding this kind of module parameters independently to each
> >>> driver, the best solution is declaring each feature only once, in the
> >>> watchdog core.
> >>>
> >>> In this way, each driver can read these "global" parameters and then,
> >>> if needed, can implement them, according to the particular hw watchdog
> >>> characteristic.
> >>>
> >>> Using this approach, it is possible reduce some duplicate code in the
> >>> *new* watchdog drivers and simplify the code maintenance.  Moreover,
> >>> the code will be clearer, since the same kind of parameters are often
> >>> called with different names (see Documentation/watchdog/watchdog-
> >> parameters.rst).
> >>> Obviously, for compatibility reasons, we cannot remove the already
> >>> existing parameters from the code of the various watchdog modules, but
> >>> we can use this "global" approach for the new watchdog drivers.
> >>>
> >>>
> >>> Global parameters declaration
> >>> ==============================
> >>>
> >>> The global parameters data structure is declared in
> >>> include/linux/watchdog.h, as::
> >>>
> >>> 	struct watchdog_global_parameters_struct {
> >>> 		int timeout;
> >>> 		int ioport;
> >>> 		int irq;
> >>> 		unsigned long features;
> >>> 		/* Bit numbers for features flags */
> >>> 		#define WDOG_GLOBAL_PARAM_VERBOSE	0
> >>> 		#define WDOG_GLOBAL_PARAM_TEST_MODE	1
> >>> 		#define WDOG_GLOBAL_PARAM_START_ENABLED	2
> >>> 		#define WDOG_GLOBAL_PARAM_NOWAYOUT	3
> >>> 	};
> >>>
> >>> The variable "feature" is a bitwise flags container, to store boolean
> >>> features, such as:
> >>>
> >>> * nowayout
> >>> * start_enable
> >>> * etc...
> >>>
> >>> Other variables can be added, to store some numerical values and other
> >>> data required.
> >>>
> >>> The global parameters are declared (as usual for the module
> >>> parameters) in the first part of drivers/watchdog/watchdog_core.c file.
> >>> The above global data structure is then managed by the function *void
> >>> global_parameters_init()*, in the same file.
> >>>
> >>> Global parameters use
> >>> =====================
> >>>
> >>> Each watchdog driver, to check if one of the global parameters is
> >>> enabled, can use the corresponding in-line function declared in
> >>> include/linux/watchdog.h.
> >>> At the moment the following functions are ready to use:
> >>>
> >>> * watchdog_global_param_verbose_enabled()
> >>> * watchdog_global_param_test_mode_enabled()
> >>> * watchdog_global_param_start_enabled()
> >>> * watchdog_global_param_nowayout_enabled()
> >>>
> >>>
> >>>
> >>> Flavio Suligoi (2):
> >>>   watchdog: add global watchdog kernel module parameters structure
> >>>   watchdog: wdat: add start_enable global parameter
> >>>
> >>>  Documentation/watchdog/index.rst              |  1 +
> >>>  .../watchdog-core-global-parameters.rst       | 74 +++++++++++++++++++
> >>>  drivers/watchdog/watchdog_core.c              | 74 +++++++++++++++++++
> >>>  drivers/watchdog/wdat_wdt.c                   |  2 +
> >>>  include/linux/watchdog.h                      | 42 +++++++++++
> >>>  5 files changed, 193 insertions(+)
> >>>  create mode 100644
> >>> Documentation/watchdog/watchdog-core-global-parameters.rst
> >>>
> > 

-- 

-----------------------------------------------------------------------------
Jerry Hoemann                  Software Engineer   Hewlett Packard Enterprise
-----------------------------------------------------------------------------
