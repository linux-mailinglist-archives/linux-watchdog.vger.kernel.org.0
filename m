Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E8D955220B1
	for <lists+linux-watchdog@lfdr.de>; Tue, 10 May 2022 18:05:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347104AbiEJQJL (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 10 May 2022 12:09:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346912AbiEJQJA (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 10 May 2022 12:09:00 -0400
Received: from mail-oa1-x31.google.com (mail-oa1-x31.google.com [IPv6:2001:4860:4864:20::31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBF7023979F
        for <linux-watchdog@vger.kernel.org>; Tue, 10 May 2022 09:05:01 -0700 (PDT)
Received: by mail-oa1-x31.google.com with SMTP id 586e51a60fabf-ee1e7362caso14710537fac.10
        for <linux-watchdog@vger.kernel.org>; Tue, 10 May 2022 09:05:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=0NdhqOyz6QgFkhd/Nh269DdoioFVfDtsnuZW6Z+yqOc=;
        b=pIyaNku/B19wKyGL0/qGamZeksCdbUnqbxlh6DRuGHzEFPi3h3YetBN292xbRPw3wu
         ExcWz+3i9WAmcwm9DtMrCH4tLfdI1pBLlcHiwGkPa1llp7B2g8nYY4BT3wAJPOjpDHQh
         otytcw2yTqRTTiAESA9KxF66jZ8TGeUkY8Dow2uCh2egIbz/ojTy9EViD2J7UvTSFt6S
         WDGJFewcU0zSvRgn3Can+wFBvNJow5rOP/h7mykEyCaXG84j254u+YPqj1ZwOmqa+3j3
         IA0FU1DZBKynHu5M3DI62n9yRJGhgtFCOXui4edRplROCJMiXvKlaZHsd7tL86JkKDCz
         oh8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
         :subject:content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=0NdhqOyz6QgFkhd/Nh269DdoioFVfDtsnuZW6Z+yqOc=;
        b=8IaweAwUOUNHFQOwZdQuWMq7zb4qw0QA9ZqSJtIZffFI0Y+Jmitcrx1iAbuZE8r1sH
         +XNQd2vsfHY6zbjorkYTL2yZjVicoxlQfOYsyfolf+AEJNcODacF911xrQGyByRk9JfJ
         6NHF4xKIPeOe8qoGc2bcwFHcxjSu0uAcv2qO+oy6CbaGLrvvsQ9TZdQQHgreF6vWO9JG
         6Hk/z/pgiJi+eOejEJO/Bn9eHgjEMa9IGMiVvtQtDJGdzFha1+1rB+I2t+neXGAI5hJ1
         epq8UMJdkB9O4K0y3POefYL2qaCqKhBRMoKe+7s3A56cfxe5d2M5eO/rCihMA8nHpg1W
         pu9Q==
X-Gm-Message-State: AOAM531Yn0eBnsKs7LsBlFFHJFHqyg3/pxaJKEqZyCGXWctSuW8Csm0F
        jnhxBrco38OnHCLoasp+YrQ=
X-Google-Smtp-Source: ABdhPJx3z79eRGeXByWV6OcQxgNUciR2tRglDSI/hVkQTiTUoW5gN82CIFiOB/tC23fJ64fe/8hIoQ==
X-Received: by 2002:a05:6870:b012:b0:ed:f22e:8aa4 with SMTP id y18-20020a056870b01200b000edf22e8aa4mr445925oae.59.1652198701042;
        Tue, 10 May 2022 09:05:01 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id t35-20020a05680815a300b0032617532120sm5406957oiw.48.2022.05.10.09.04.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 May 2022 09:04:58 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <628a1540-4768-61ca-27e1-b6507cc00086@roeck-us.net>
Date:   Tue, 10 May 2022 09:04:55 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [RFC v2 2/2] watchdog: pseries-wdt: initial support for PAPR
 virtual watchdog timers
Content-Language: en-US
To:     Scott Cheloha <cheloha@linux.ibm.com>,
        Tzung-Bi Shih <tzungbi@kernel.org>
Cc:     linux-watchdog@vger.kernel.org, brking@linux.ibm.com,
        Nathan Lynch <nathanl@linux.ibm.com>, aik@ozlabs.ru,
        npiggin@gmail.com, vaishnavi@linux.ibm.com, wvoigt@us.ibm.com
References: <20220509174357.5448-1-cheloha@linux.ibm.com>
 <20220509174357.5448-3-cheloha@linux.ibm.com> <YnnPdv+Hh9UEHMu/@google.com>
 <7D3AFBE4-ECDF-4CBC-9B3F-55AD62C18A3C@linux.ibm.com>
From:   Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <7D3AFBE4-ECDF-4CBC-9B3F-55AD62C18A3C@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 5/10/22 08:48, Scott Cheloha wrote:
>> On May 9, 2022, at 9:35 PM, Tzung-Bi Shih <tzungbi@kernel.org> wrote:
>>
>> On Mon, May 09, 2022 at 12:43:57PM -0500, Scott Cheloha wrote:
>>> +#define SETFIELD(_v, _b, _e)	\
>>> +    (((unsigned long)(_v) << PPC_BITLSHIFT(_e)) & PPC_BITMASK((_b), (_e)))
>>> +#define GETFIELD(_v, _b, _e)	\
>>> +    (((unsigned long)(_v) & PPC_BITMASK((_b), (_e))) >> PPC_BITLSHIFT(_e))
>>
>>  From `./scripts/checkpatch.pl --strict`:
>> WARNING: please, no spaces at the start of a line
>>
>>> +#define PSERIES_WDTQL_MUST_STOP       	1
>>
>>  From `./scripts/checkpatch.pl --strict`:
>> WARNING: please, no space before tabs
>>
>>> +static const struct kernel_param_ops action_ops = { .set = action_set };
>>> +module_param_cb(action, &action_ops, NULL, S_IRUGO);
>>
>>  From `./scripts/checkpatch.pl --strict`:
>> WARNING: Symbolic permissions 'S_IRUGO' are not preferred. Consider using
>> octal permissions '0444'.
>>
>>> +MODULE_PARM_DESC(action, "Action taken when watchdog expires: \"hard-poweroff\", \"hard-restart\", or \"dump-restart\" (default=\"hard-restart\")");
>>
>> The line exceeds 100 columns.
> 
> I was under the impression that strings were an exception to the
> line-length rule.  Is that not the case?
> 
You can use

MODULE_PARM_DESC(action,
		 "Some text");

> `scripts/checkpatch.pl --strict` complains if I break the string up:
> 
> WARNING: quoted string split across lines
> #162: FILE: drivers/watchdog/pseries-wdt.c:162:
> +MODULE_PARM_DESC(action, "Action taken when watchdog expires: "
> +		 "\"hard-poweroff\", \"hard-restart\", or \"dump-restart\" "
> 
> WARNING: quoted string split across lines
> #163: FILE: drivers/watchdog/pseries-wdt.c:163:
> +		 "\"hard-poweroff\", \"hard-restart\", or \"dump-restart\" "
> +		 "(default=\"hard-restart\")");
> 
>>> +static bool nowayout = WATCHDOG_NOWAYOUT;
>>> +module_param(nowayout, bool, S_IRUGO);
>>
>>  From `./scripts/checkpatch.pl --strict`:
>> WARNING: Symbolic permissions 'S_IRUGO' are not preferred. Consider using
>> octal permissions '0444'.
>>
>>> +MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started (default=" __MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
>>
>>  From `./scripts/checkpatch.pl --strict`, the line exceeds 100 columns.
> 
>>
>>> +#define WATCHDOG_TIMEOUT 60
>>> +static unsigned int timeout = WATCHDOG_TIMEOUT;
>>> +module_param(timeout, uint, S_IRUGO);
>>
>>  From `./scripts/checkpatch.pl --strict`:
>> WARNING: Symbolic permissions 'S_IRUGO' are not preferred. Consider using
>> octal permissions '0444'.
>>
>>> +MODULE_PARM_DESC(timeout, "Initial watchdog timeout in seconds (default=" __MODULE_STRING(WATCHDOG_TIMEOUT) ")");
>>
>>  From `./scripts/checkpatch.pl --strict`, the line exceeds 100 columns.
>>
>>> +struct pseries_wdt {
>>> +	struct watchdog_device wd;
>>> +	unsigned long num;		/* NB: Watchdog numbers are 1-based */
>>
>> What does NB stand for?  Could it be removed from the comment?
> 
> Sure, removed.
> 
>> Does `timer_id` or some other equivalent names make more sense for the
>> variable?
> 
> The hardware documentation calls the parameter "watchdogNumber", so
> I think "num" is better than "id" in this case.
> 

