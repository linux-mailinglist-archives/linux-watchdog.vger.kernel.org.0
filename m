Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 59545331E9E
	for <lists+linux-watchdog@lfdr.de>; Tue,  9 Mar 2021 06:25:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230081AbhCIFZO (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 9 Mar 2021 00:25:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229872AbhCIFZD (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 9 Mar 2021 00:25:03 -0500
Received: from desiato.infradead.org (desiato.infradead.org [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA373C06175F
        for <linux-watchdog@vger.kernel.org>; Mon,  8 Mar 2021 21:25:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
        :In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:
        Sender:Reply-To:Content-ID:Content-Description;
        bh=L2PrEq9PiQQjCd9Gf1J/rJzNdi3nSORDhWXiEIr8Vag=; b=GPmOB4mFnbeoQaFTYCArcc5Jv/
        EHlXJ2ww+uKs48V62wnvTECz1YfJCJuJXoyMQYpeKg8INXJEDea0yqBI9aF9nrUVLyYl/WER/5U28
        UofT1Rwf7IjQtQz0qvwezDf5D3gwFScRkm8cxRV+8k7xiVRajorCjqA/mSnBIv6jzRuxRUQ5z3g6K
        cW1tRYg08AzTDSkyOeFtzH+hu0x0O6IaZ/VEJtnuo36gbTOEFZ+t14CH/X6VVonZ238CHnisojjbw
        NRZ6J4eFlx9es/qmQd2eZFSkSQrbsqDyHPFaDJxHGNQNuipgc7BAIVHrV781WDq9DsD25bbPjzwqg
        4SuYS87Q==;
Received: from merlin.infradead.org ([2001:8b0:10b:1234::107])
        by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
        id 1lJUrc-003o04-Tp
        for linux-watchdog@vger.kernel.org; Tue, 09 Mar 2021 05:25:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description;
        bh=L2PrEq9PiQQjCd9Gf1J/rJzNdi3nSORDhWXiEIr8Vag=; b=EF7SOC8hiwxKua6r+AKdKVvESJ
        fWJLyQlMCxinCMHHNu9ob6pHoVW4svnNQMg3FIGVRH+6jXNQv09wxjpCMF3pWzqH/IlT3ESpwZnKD
        3o8lIjurd6v59PZZorDrLBlPUCSroFJr5zQG/kEhE0FO1Ye4tid0IvpbFwwKAtytLEllGJ589n6ia
        x++JR8LRBks9UfKzIsS1SiRE2MdwliZ6cgOhzCg4Lry2VMHIjaqyUyuzoPnF8TKrRgp5hz5wYxEQa
        VjyI+5XHCh4QDI45Oophek8sW7aJkSGfuyI0jQuYYwc8AmPA9N703OBJnd0XeH9G6GYlHoHSVAxBk
        2skAguYg==;
Received: from [2601:1c0:6280:3f0::3ba4]
        by merlin.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
        id 1lJUrE-000cK6-MB; Tue, 09 Mar 2021 05:24:37 +0000
Subject: Re: [PATCH v1 1/2] watchdog: add global watchdog kernel module
 parameters structure
To:     Flavio Suligoi <f.suligoi@asem.it>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210308112151.716315-1-f.suligoi@asem.it>
 <20210308112151.716315-2-f.suligoi@asem.it>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <0e203992-cbff-738f-4629-368578cb992d@infradead.org>
Date:   Mon, 8 Mar 2021 21:24:32 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210308112151.716315-2-f.suligoi@asem.it>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi,

On 3/8/21 3:21 AM, Flavio Suligoi wrote:
> Different watchdog modules frequently require the same type of parameters
> (for example: timeout, nowayout feature, start wdog on module insertion,
> etc.).
> Instead of adding this kind of module parameters independently to each
> driver, the best solution is declaring each feature only once,
> in the watchdog core.
> 
> In this way, each driver can read these "global" parameters and then,
> if needed, implements them, according to the particular hw watchdog
> characteristic.
> 
> Using this approach, it will be possible reduce some duplicate code
> in the _new_ watchdog drivers and simplify the code maintenance.
> Moreover, the code will be clearer, since the same kind of parameters
> are often called with different names.
> Just for example, reading the doc file:
> 
> Documentation/watchdog/watchdog-parameters.rst
> 
> the "timeout" feature is called in the following ways:
> 
...

> 
> Obviously, we cannot remove these customized parameters from the code,
> for compatibility reasons, but we can use this new "global" parameters
> structure for the new watchdog drivers.
> 
> This patch adds the base structure to add the global parameters, starting
> with some common integer data (timeout, ioport, irq) and a bitwise
> "features" flag, where we can store some boolean features (verbose,
> test_mode, start_enabled, nowayout, etc.)
> 
> Signed-off-by: Flavio Suligoi <f.suligoi@asem.it>
> ---
>  Documentation/watchdog/index.rst              |  1 +
>  .../watchdog-core-global-parameters.rst       | 74 +++++++++++++++++++
>  drivers/watchdog/watchdog_core.c              | 74 +++++++++++++++++++
>  include/linux/watchdog.h                      | 42 +++++++++++
>  4 files changed, 191 insertions(+)
>  create mode 100644 Documentation/watchdog/watchdog-core-global-parameters.rst
> 

> diff --git a/Documentation/watchdog/watchdog-core-global-parameters.rst b/Documentation/watchdog/watchdog-core-global-parameters.rst
> new file mode 100644
> index 000000000000..332fe0c6ada0
> --- /dev/null
> +++ b/Documentation/watchdog/watchdog-core-global-parameters.rst
> @@ -0,0 +1,74 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +===============================
> +Watchdog Core Global Parameters
> +===============================
> +
> +Information for watchdog kernel modules developers.
> +
> +Introduction
> +============
> +
> +Different watchdog modules frequently require the same type of parameters
> +(for example: *timeout*, *nowayout* feature, *start_enabled* to start the
> +watchdog on module insertion, etc.).
> +Instead of adding this kind of module parameters independently to each driver,
> +the best solution is declaring each feature only once, in the watchdog core.
> +
> +In this way, each driver can read these "global" parameters and then,
> +if needed, can implement them, according to the particular hw watchdog

Please spell out "hardware" (not "hw").

> +characteristic.
> +
> +Using this approach, it is possible reduce some duplicate code in the *new*

                              possible to reduce

> +watchdog drivers and simplify the code maintenance.  Moreover, the code will
> +be clearer, since the same kind of parameters are often called with different
> +names (see Documentation/watchdog/watchdog-parameters.rst).
> +Obviously, for compatibility reasons, we cannot remove the already existing
> +parameters from the code of the various watchdog modules, but we can use this
> +"global" approach for the new watchdog drivers.
> +
> +
> +Global parameters declaration
> +==============================
> +
> +The global parameters data structure is declared in include/linux/watchdog.h,
> +as::
> +
> +	struct watchdog_global_parameters_struct {
> +		int timeout;
> +		int ioport;
> +		int irq;
> +		unsigned long features;
> +		/* Bit numbers for features flags */
> +		#define WDOG_GLOBAL_PARAM_VERBOSE	0
> +		#define WDOG_GLOBAL_PARAM_TEST_MODE	1
> +		#define WDOG_GLOBAL_PARAM_START_ENABLED	2
> +		#define WDOG_GLOBAL_PARAM_NOWAYOUT	3
> +	};
> +
> +The variable "feature" is a bitwise flags container, to store boolean
> +features, such as:
> +
> +* nowayout
> +* start_enable

     start_enabled
everywhere else.

> +* etc...
> +
> +Other variables can be added, to store some numerical values and other data
> +required.
> +
> +The global parameters are declared (as usual for the module parameters) in the
> +first part of drivers/watchdog/watchdog_core.c file.
> +The above global data structure is then managed by the function
> +*void global_parameters_init()*, in the same file.
> +
> +Global parameters use
> +=====================
> +
> +Each watchdog driver, to check if one of the global parameters is enabled, can
> +use the corresponding in-line function declared in include/linux/watchdog.h.
> +At the moment the following functions are ready to use:
> +
> +* watchdog_global_param_verbose_enabled()
> +* watchdog_global_param_test_mode_enabled()
> +* watchdog_global_param_start_enabled()
> +* watchdog_global_param_nowayout_enabled()

> diff --git a/drivers/watchdog/watchdog_core.c b/drivers/watchdog/watchdog_core.c
> index 5df0a22e2cb4..fd710be22390 100644
> --- a/drivers/watchdog/watchdog_core.c
> +++ b/drivers/watchdog/watchdog_core.c
> @@ -43,6 +43,78 @@ static int stop_on_reboot = -1;
>  module_param(stop_on_reboot, int, 0444);
>  MODULE_PARM_DESC(stop_on_reboot, "Stop watchdogs on reboot (0=keep watching, 1=stop)");
>  
> +/* verbose - Global parameter */
> +static bool glob_param_verbose;
> +module_param_named(verbose, glob_param_verbose, bool, 0);
> +MODULE_PARM_DESC(verbose, "Add verbosity/debug messages");
> +
> +/* test_mode - Global parameter */
> +static bool glob_param_test_mode;
> +module_param_named(test_mode, glob_param_test_mode, bool, 0);
> +MODULE_PARM_DESC(test_mode, "Watchdog testmode (1 = no reboot), default=0");
> +
> +/* start_enable - Global parameter */
> +static bool glob_param_start_enabled;
> +module_param_named(start_enabled, glob_param_start_enabled, bool, 0);
> +MODULE_PARM_DESC(start_enabled, "Watchdog is started on module insertion "
> +		"(default=0)");
> +
> +/* nowayout - Global parameter */
> +static bool glob_param_nowayout = WATCHDOG_NOWAYOUT;
> +module_param_named(nowayout, glob_param_nowayout, bool, 0);
> +MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started "
> +		"(default=" __MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
> +/*
> + * Watchdog "global" kernel parameters, common for all wdog drivers.
> + *
> + * Sometimes different watchdog modules need the same type of parameters
> + * (for example: timeout, nowayout feature, start wdog on module insertion,
> + * etc.).
> + * Instead of add this kind of module parameters independently to each driver,

                 adding

> + * the best solution is declare each feature only once, in the watchdog core.
> + *
> + * In this way, each driver can read these "global" parameters and then,
> + * if needed, implements them, according to the particular hw watchdog

s/hw/hardware/

> + * characteristic.
> + */
> +struct watchdog_global_parameters_struct watchdog_global_parameters;
> +EXPORT_SYMBOL_GPL(watchdog_global_parameters);


If I were doing (or using) this, I would probably want 'test_mode' and
'verbosity' to be unsigned int masks instead of a bool, so that there could
be multiple types of test_mode or verbosity.
That's something that some other subsystems do, but maybe watchdog is simple
enough that it's not needed.
If it is needed, then we are back to each driver doing it its own way (until
this patch is updated).


HTH. thanks.
-- 
~Randy

