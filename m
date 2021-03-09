Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE87933303D
	for <lists+linux-watchdog@lfdr.de>; Tue,  9 Mar 2021 21:50:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231357AbhCIUuB (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 9 Mar 2021 15:50:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230431AbhCIUt2 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 9 Mar 2021 15:49:28 -0500
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com [IPv6:2607:f8b0:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD7A1C06174A;
        Tue,  9 Mar 2021 12:49:28 -0800 (PST)
Received: by mail-ot1-x32d.google.com with SMTP id j22so8355325otp.2;
        Tue, 09 Mar 2021 12:49:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ppmtmTzEyp6Q14aIrHcpkXPKTouWlIqAt7YxR2T/7tI=;
        b=fozZbYDmbNhJ1BIfbz1R8O23fRMny7KNYbYesz8UxSvNKKAWDGhPgb6dprXsr9dZXa
         EXwDatK2WsUxCWCLurosVC5XSPNGDWZc4SZ+VF5MsTuhnt3UuMy2RnqdzZnmEHq2wV7y
         21ePSSrySnfUBrvVXD6REsJLF1vgytWlFRGOtAD2CndKtdTa9hpVG+EK8k9kDQLrTCe0
         KA2uPfye4UbA1kELserxR8C3vhkAc1JBZKVg7ux0z0Jc6mZyD9VZO/3eueWoCzBBssYW
         sZHmgwu7g4FGMe/ES5RVfROZq64l1SU6ILLdkVsc98mMgmxW+S/SY2d9GJUmUHI+ODx8
         vVSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=ppmtmTzEyp6Q14aIrHcpkXPKTouWlIqAt7YxR2T/7tI=;
        b=ZBntT51RHEemDnAQEJc2jfyj1CkE/uOPjni8ro5w86xmuA/EOwEgf0wDVxaDIBHyh8
         Me1iFBjir/t8Cvoy/HT7VjxrbCKHBNv/VaB6zk+TOs0NGBpJhJmEoyRR4NrNd/+0bYu3
         BxJeGBg2J7vaEpGzSsivLhLj32eagk2wUOJUcbpO+KGRyCD8pfxFIlwRUspTbF6qwEUx
         mpXcOFWRoq8INe5GH2Yf9en39QLPsiOais1aagTcTLPYWPjavlNH08WxevmQvxUkHzPu
         8OCrS+eSuv1lPsKIpRVx2Zhg4dwU3+Cj/Rnx2xN5X/I30Ar97HbkrYxJ8Rp5p4H946k7
         AeWw==
X-Gm-Message-State: AOAM530iT/lriXyMqKBluR0LTvTwFxBojWZSr4uN5dwrqgf7RryzbUqA
        +PTJd0CWQ2wrluzZLpm9SQQ=
X-Google-Smtp-Source: ABdhPJwgw/WKpJ0U22FERsCf1WMcIqWCLsgwYWCnAmpEbrEG8xXxWd5Nz4z2LjilF9Pmn9RPsQLNmA==
X-Received: by 2002:a9d:4e1a:: with SMTP id p26mr24550otf.202.1615322968109;
        Tue, 09 Mar 2021 12:49:28 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id e2sm3629890oti.8.2021.03.09.12.49.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Mar 2021 12:49:27 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH v1 0/2] Watchdog Core Global Parameters
To:     Jerry Hoemann <jerry.hoemann@hpe.com>
Cc:     Flavio Suligoi <f.suligoi@asem.it>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
References: <20210308112151.716315-1-f.suligoi@asem.it>
 <d47fcc00-58fa-5850-7599-74644b34e39f@roeck-us.net>
 <984953abc23c4cd6a4a6a5b77ae72e66@asem.it>
 <1500d5fe-5228-1671-2008-4b7e30e856ea@roeck-us.net>
 <20210309184216.GN234518@anatevka.americas.hpqcorp.net>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <96a752d7-2818-70a5-ef69-0322f6b9bc42@roeck-us.net>
Date:   Tue, 9 Mar 2021 12:49:25 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210309184216.GN234518@anatevka.americas.hpqcorp.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 3/9/21 10:42 AM, Jerry Hoemann wrote:
> On Tue, Mar 09, 2021 at 07:22:28AM -0800, Guenter Roeck wrote:
>> On 3/9/21 2:26 AM, Flavio Suligoi wrote:
>>> Hi Guenter,
>>>
>>>>> Instead of adding this kind of module parameters independently to each
>>>>> driver, the best solution is declaring each feature only once, in the
>>>>> watchdog core.
>>>>>
>>>>
>>>> I agree to and like the idea, but I don't see the point of letting drivers opt in
>>>> or opt out. This adds a lot of complexity for little if any gain.
>>>
>>> Do you mean that all the support for this "global parameters" should be done
>>> in the watchdog-core only, without write any code in each single
>>> "hardware" driver?
>>
>> Correct. It should not be up to the driver author to decide if they
>> want to opt out from global parameters or not. It should be up to
>> users, and users can opt out by not providing the parameters.
> 
> 
> Guenter,
> 
> What about parameters like "pretimeout"  that only some WD drivers have
> hw to support?
> 

Those drivers are supposed to set WDIOF_PRETIMEOUT. If they don't, any associated
module parameter would be ignored. That is quite similar to any other non-existing
module parameter.

> Might be nice to centralize these parameters as well, but leaving it up
> to users to decide might not make sense.
> 

Decide what, exactly ? Users can still provide a pretimeout module
parameter even if pretimeout is not supported for a given watchdog.
That is the case today, and it won't change.

Given that, I must admit that I don't really understand your concern.

> Or do you see the recent work to allow for a software pretimeout
> mechanism covering this?
>

That is completely orthogonal.

Guenter

> thanks
> 
> Jerry
> 
>>
>> Guenter
>>
>>>>
>>>> Guenter
>>>
>>> Regards,
>>>
>>> Flavio
>>>
>>>>
>>>>> Additionally, I added a implementation example of this "global"
>>>>> parameters using the module "wdat_wdt"
>>>>>
>>>>> In details:
>>>>>
>>>>> ===============================
>>>>> Watchdog Core Global Parameters
>>>>> ===============================
>>>>>
>>>>> Information for watchdog kernel modules developers.
>>>>>
>>>>> Introduction
>>>>> ============
>>>>>
>>>>> Different watchdog modules frequently require the same type of
>>>>> parameters (for example: *timeout*, *nowayout* feature,
>>>>> *start_enabled* to start the watchdog on module insertion, etc.).
>>>>> Instead of adding this kind of module parameters independently to each
>>>>> driver, the best solution is declaring each feature only once, in the
>>>>> watchdog core.
>>>>>
>>>>> In this way, each driver can read these "global" parameters and then,
>>>>> if needed, can implement them, according to the particular hw watchdog
>>>>> characteristic.
>>>>>
>>>>> Using this approach, it is possible reduce some duplicate code in the
>>>>> *new* watchdog drivers and simplify the code maintenance.  Moreover,
>>>>> the code will be clearer, since the same kind of parameters are often
>>>>> called with different names (see Documentation/watchdog/watchdog-
>>>> parameters.rst).
>>>>> Obviously, for compatibility reasons, we cannot remove the already
>>>>> existing parameters from the code of the various watchdog modules, but
>>>>> we can use this "global" approach for the new watchdog drivers.
>>>>>
>>>>>
>>>>> Global parameters declaration
>>>>> ==============================
>>>>>
>>>>> The global parameters data structure is declared in
>>>>> include/linux/watchdog.h, as::
>>>>>
>>>>> 	struct watchdog_global_parameters_struct {
>>>>> 		int timeout;
>>>>> 		int ioport;
>>>>> 		int irq;
>>>>> 		unsigned long features;
>>>>> 		/* Bit numbers for features flags */
>>>>> 		#define WDOG_GLOBAL_PARAM_VERBOSE	0
>>>>> 		#define WDOG_GLOBAL_PARAM_TEST_MODE	1
>>>>> 		#define WDOG_GLOBAL_PARAM_START_ENABLED	2
>>>>> 		#define WDOG_GLOBAL_PARAM_NOWAYOUT	3
>>>>> 	};
>>>>>
>>>>> The variable "feature" is a bitwise flags container, to store boolean
>>>>> features, such as:
>>>>>
>>>>> * nowayout
>>>>> * start_enable
>>>>> * etc...
>>>>>
>>>>> Other variables can be added, to store some numerical values and other
>>>>> data required.
>>>>>
>>>>> The global parameters are declared (as usual for the module
>>>>> parameters) in the first part of drivers/watchdog/watchdog_core.c file.
>>>>> The above global data structure is then managed by the function *void
>>>>> global_parameters_init()*, in the same file.
>>>>>
>>>>> Global parameters use
>>>>> =====================
>>>>>
>>>>> Each watchdog driver, to check if one of the global parameters is
>>>>> enabled, can use the corresponding in-line function declared in
>>>>> include/linux/watchdog.h.
>>>>> At the moment the following functions are ready to use:
>>>>>
>>>>> * watchdog_global_param_verbose_enabled()
>>>>> * watchdog_global_param_test_mode_enabled()
>>>>> * watchdog_global_param_start_enabled()
>>>>> * watchdog_global_param_nowayout_enabled()
>>>>>
>>>>>
>>>>>
>>>>> Flavio Suligoi (2):
>>>>>   watchdog: add global watchdog kernel module parameters structure
>>>>>   watchdog: wdat: add start_enable global parameter
>>>>>
>>>>>  Documentation/watchdog/index.rst              |  1 +
>>>>>  .../watchdog-core-global-parameters.rst       | 74 +++++++++++++++++++
>>>>>  drivers/watchdog/watchdog_core.c              | 74 +++++++++++++++++++
>>>>>  drivers/watchdog/wdat_wdt.c                   |  2 +
>>>>>  include/linux/watchdog.h                      | 42 +++++++++++
>>>>>  5 files changed, 193 insertions(+)
>>>>>  create mode 100644
>>>>> Documentation/watchdog/watchdog-core-global-parameters.rst
>>>>>
>>>
> 

