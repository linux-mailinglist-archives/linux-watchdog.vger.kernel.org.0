Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E6093331775
	for <lists+linux-watchdog@lfdr.de>; Mon,  8 Mar 2021 20:40:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231219AbhCHTj7 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 8 Mar 2021 14:39:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229650AbhCHTj3 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 8 Mar 2021 14:39:29 -0500
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com [IPv6:2607:f8b0:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78825C06174A;
        Mon,  8 Mar 2021 11:39:29 -0800 (PST)
Received: by mail-ot1-x334.google.com with SMTP id a17so10415184oto.5;
        Mon, 08 Mar 2021 11:39:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=fchs7bSeiqCmhuaprvM6DnK2VYhgG5gbLzQ0p1oAtqw=;
        b=Tw4VdLX4zEoX1X2Xe36F0gHuMEm1YXzcIopl22XhsDucKZQ/ztsB7ronV9tBwOQ2RN
         QyFyd4l+fbqV45EKLng3Q2D+DTRLQ+bbZQzkB2wQGks2G//5zVOmOZHaPvuZqmvTbEQm
         ZFQ2AiH0LTvXQDdPGXsWVlurhxzSsxcekKXgjeWdXjNbzBqu/N91aZhk20S5bP1xiqRm
         k2S8+VdNl/PB3TkJMYj1/4SmKV0C+fhc8h/n1mQ2lLTmC2wUtfq+6tvgjb+YKmqh9OFi
         puZtXoirQeG6CVhkL7N3n+DJaZis5Upmt1zgORwqzK+wsfj6n2wi0jFFOpiMaUFznoLh
         QvFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=fchs7bSeiqCmhuaprvM6DnK2VYhgG5gbLzQ0p1oAtqw=;
        b=S/3dkKRcOyFGGsK8rLbIliMLgnpGLZ/6j+ounJpijLfU67XY1rP/grBnYZPAnBg8oq
         O4EuVZMR00FDBKtsxCIZ+0/dYpnrHY1Nw9EATYyb+Ae7d8EGmGncbufxweg3/j0Q68r/
         RBshNl3Dgws6h6rucf8FqlvTYsrFR7I5VRcLr43Y2niIpDBVRX23p2K2rYxxTc5xpuW8
         hEqK5FWwX5t6+ylWSCDcFbZhB+4s5p50iaolBh7A+KIUG0udVZHNuf2cyFjhS6IGK944
         CpXGWH6ecNveyxkcM25ORw1gHDGSDe8/9yJuJ3JfNiQKrkZikMA3sMp+nvbAvMMLtJHY
         U5Ww==
X-Gm-Message-State: AOAM53008uOdtwJ/vvERtlEb1O4WmozFuphISsCZdYmT9uV00R/Jp1H3
        jUiLMwUmpbGIPrPM2wzTcevT04+Vqv8=
X-Google-Smtp-Source: ABdhPJwR8xXSWsiou78MEUS6QZ3+WEa9F5CAGtBR8McuUFZvFrhvrv8cAdvR/WTSFKZizPx7bZG3HQ==
X-Received: by 2002:a9d:4e14:: with SMTP id p20mr13439516otf.94.1615232368599;
        Mon, 08 Mar 2021 11:39:28 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id f29sm2942544ots.22.2021.03.08.11.39.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Mar 2021 11:39:27 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH v1 0/2] Watchdog Core Global Parameters
To:     Flavio Suligoi <f.suligoi@asem.it>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210308112151.716315-1-f.suligoi@asem.it>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <d47fcc00-58fa-5850-7599-74644b34e39f@roeck-us.net>
Date:   Mon, 8 Mar 2021 11:39:25 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210308112151.716315-1-f.suligoi@asem.it>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 3/8/21 3:21 AM, Flavio Suligoi wrote:
> This patch series add a new way to consider the module parameters for the
> watchdog module.
> 
> Instead of adding this kind of module parameters independently to each
> driver, the best solution is declaring each feature only once,
> in the watchdog core.
> 

I agree to and like the idea, but I don't see the point of letting drivers
opt in or opt out. This adds a lot of complexity for little if any gain.

Guenter

> Additionally, I added a implementation example of this "global" parameters
> using the module "wdat_wdt"
> 
> In details:
> 
> ===============================
> Watchdog Core Global Parameters
> ===============================
> 
> Information for watchdog kernel modules developers.
> 
> Introduction
> ============
> 
> Different watchdog modules frequently require the same type of parameters
> (for example: *timeout*, *nowayout* feature, *start_enabled* to start the
> watchdog on module insertion, etc.).
> Instead of adding this kind of module parameters independently to each
> driver, the best solution is declaring each feature only once,
> in the watchdog core.
> 
> In this way, each driver can read these "global" parameters and then,
> if needed, can implement them, according to the particular hw watchdog
> characteristic.
> 
> Using this approach, it is possible reduce some duplicate code in the *new*
> watchdog drivers and simplify the code maintenance.  Moreover, the code
> will be clearer, since the same kind of parameters are often called
> with different names (see Documentation/watchdog/watchdog-parameters.rst).
> Obviously, for compatibility reasons, we cannot remove the already existing
> parameters from the code of the various watchdog modules, but we can use
> this "global" approach for the new watchdog drivers.
> 
> 
> Global parameters declaration
> ==============================
> 
> The global parameters data structure is declared in
> include/linux/watchdog.h, as::
> 
> 	struct watchdog_global_parameters_struct {
> 		int timeout;
> 		int ioport;
> 		int irq;
> 		unsigned long features;
> 		/* Bit numbers for features flags */
> 		#define WDOG_GLOBAL_PARAM_VERBOSE	0
> 		#define WDOG_GLOBAL_PARAM_TEST_MODE	1
> 		#define WDOG_GLOBAL_PARAM_START_ENABLED	2
> 		#define WDOG_GLOBAL_PARAM_NOWAYOUT	3
> 	};
> 
> The variable "feature" is a bitwise flags container, to store boolean
> features, such as:
> 
> * nowayout
> * start_enable
> * etc...
> 
> Other variables can be added, to store some numerical values and other data
> required.
> 
> The global parameters are declared (as usual for the module parameters)
> in the first part of drivers/watchdog/watchdog_core.c file.
> The above global data structure is then managed by the function
> *void global_parameters_init()*, in the same file.
> 
> Global parameters use
> =====================
> 
> Each watchdog driver, to check if one of the global parameters is enabled,
> can use the corresponding in-line function declared in
> include/linux/watchdog.h.
> At the moment the following functions are ready to use:
> 
> * watchdog_global_param_verbose_enabled()
> * watchdog_global_param_test_mode_enabled()
> * watchdog_global_param_start_enabled()
> * watchdog_global_param_nowayout_enabled()
> 
> 
> 
> Flavio Suligoi (2):
>   watchdog: add global watchdog kernel module parameters structure
>   watchdog: wdat: add start_enable global parameter
> 
>  Documentation/watchdog/index.rst              |  1 +
>  .../watchdog-core-global-parameters.rst       | 74 +++++++++++++++++++
>  drivers/watchdog/watchdog_core.c              | 74 +++++++++++++++++++
>  drivers/watchdog/wdat_wdt.c                   |  2 +
>  include/linux/watchdog.h                      | 42 +++++++++++
>  5 files changed, 193 insertions(+)
>  create mode 100644 Documentation/watchdog/watchdog-core-global-parameters.rst
> 

