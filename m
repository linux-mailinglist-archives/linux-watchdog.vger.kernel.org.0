Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 08E4953AA60
	for <lists+linux-watchdog@lfdr.de>; Wed,  1 Jun 2022 17:45:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355889AbiFAPpU (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 1 Jun 2022 11:45:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355831AbiFAPpJ (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 1 Jun 2022 11:45:09 -0400
Received: from mail-oa1-x2a.google.com (mail-oa1-x2a.google.com [IPv6:2001:4860:4864:20::2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD10D12635
        for <linux-watchdog@vger.kernel.org>; Wed,  1 Jun 2022 08:45:07 -0700 (PDT)
Received: by mail-oa1-x2a.google.com with SMTP id 586e51a60fabf-edeb6c3642so3246376fac.3
        for <linux-watchdog@vger.kernel.org>; Wed, 01 Jun 2022 08:45:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:content-language:to
         :cc:references:from:subject:in-reply-to:content-transfer-encoding;
        bh=CxGPdJ+d3VmCiVOx15dnO86NTnzcGQYc9otHCDK4uKA=;
        b=aJ0SNzCGXtaMFOHq+yCghe0IeO4G9Elty0yPxLB77/+1ujGlHW0sINLxyIjdo63SA3
         JfhoO9EqTsoZDYPbneUjYMp0cnQGRFF8P45SHLX4QE2fsodSq3ZpCnmdKd1lXLEHZqMd
         hN8DY10MGvZPLx8FLIWCoo45PlKN8B6CHw+Gp+MtjjyLT0mPxQOO1W63diVqH6G0WzUY
         +i5unjChkPo5khqc9kxy7PC4Wv83cvrbD3FEahAC0xXDjN7Jie1eRHCE4F//t89AspvD
         Kvq5VNdjEDZm+2duCyA6ViAyDPmdjVC2AUUVWkDiq4piP7gK1O0X0QkaFR8PSJ2NGBNI
         i6sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
         :content-language:to:cc:references:from:subject:in-reply-to
         :content-transfer-encoding;
        bh=CxGPdJ+d3VmCiVOx15dnO86NTnzcGQYc9otHCDK4uKA=;
        b=nBQ0v5iIC0IGR/Ci1BcWQ4uHFygkQb+7Yk/DA6WCWFRLU3PUc0BKlTwH/V0XuEyqlw
         2WnKjdrOM2Tv4cNmwsXjW87oVn9Gao1QiseWx+54YeZQfFDZz9vlcOoucsQBSznfEyhT
         MRJHWK92GfQb/UJP2Bz/ZNIvtl9bRpDfEZxmwocYDpUt21tLLZmsjzZ5HWR/22XnZk+O
         1UXO5m3pQFoLEQjMOLz7Bu1R6H8+Gvkq88kvmgSRZ3gRqgBLC2SswOtUGwAZeJRB4nI1
         /2BW04j/YvKTVmAJ0ngbjnQ3nFfFf03wZg2fxibLXfUjEUET2OaHRl3Qy1GnRMuZtQnZ
         KDVg==
X-Gm-Message-State: AOAM5318OiHk5IvlWGeWFxEot91G4ixlhB6j1mpYFK3zoswwHv33ZiBg
        k3MsuvhqBbbpMLPCCCmTp4S8ZYgsA/s=
X-Google-Smtp-Source: ABdhPJz6xXrJ8vF6Af+LhH1lpt9jxSDQvqzDv4qVriyQtAWfN/GaC3ZxdDeWydFQdNcUBQ5XUiKldA==
X-Received: by 2002:a05:6870:65a9:b0:f5:da7a:17d with SMTP id fp41-20020a05687065a900b000f5da7a017dmr39512oab.218.1654098306012;
        Wed, 01 Jun 2022 08:45:06 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id q16-20020a056870e89000b000f337992dfbsm779712oan.53.2022.06.01.08.45.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jun 2022 08:45:05 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <a6090ef3-f597-e10b-010b-cc32bff08c93@roeck-us.net>
Date:   Wed, 1 Jun 2022 08:45:03 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Content-Language: en-US
To:     Scott Cheloha <cheloha@linux.ibm.com>
Cc:     Alexey Kardashevskiy <aik@ozlabs.ru>,
        linux-watchdog@vger.kernel.org, tzungbi@kernel.org,
        brking@linux.ibm.com, nathanl@linux.ibm.com, npiggin@gmail.com,
        vaishnavi@linux.ibm.com, wvoigt@us.ibm.com,
        linuxppc-dev@lists.ozlabs.org
References: <20220520183552.33426-1-cheloha@linux.ibm.com>
 <20220520183552.33426-5-cheloha@linux.ibm.com>
 <74498c4b-7b6a-3864-1ae8-57e848a1254c@ozlabs.ru>
 <1f007ad5-8367-9593-bb80-d3564f3cf997@roeck-us.net>
 <YpeArFvOWtk6TQ5r@rascal-austin-ibm-com>
From:   Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v1 4/4] watchdog/pseries-wdt: initial support for PAPR
 H_WATCHDOG timers
In-Reply-To: <YpeArFvOWtk6TQ5r@rascal-austin-ibm-com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 6/1/22 08:07, Scott Cheloha wrote:
[ ... ]
>>>> +static unsigned long action = PSERIES_WDTF_ACTION_HARD_RESTART;
>>>> +
>>>> +static int action_get(char *buf, const struct kernel_param *kp)
>>>> +{
>>>> +    int val;
>>>> +
>>>> +    switch (action) {
>>>> +    case PSERIES_WDTF_ACTION_HARD_POWEROFF:
>>>> +        val = 1;
>>>> +        break;
>>>> +    case PSERIES_WDTF_ACTION_HARD_RESTART:
>>>> +        val = 2;
>>>> +        break;
>>>> +    case PSERIES_WDTF_ACTION_DUMP_RESTART:
>>>> +        val = 3;
>>>> +        break;
>>>> +    default:
>>>> +        return -EINVAL;
>>>> +    }
>>>> +    return sprintf(buf, "%d\n", val);
>>>> +}
>>>> +
>>>> +static int action_set(const char *val, const struct kernel_param *kp)
>>>> +{
>>>> +    int choice;
>>>> +
>>>> +    if (kstrtoint(val, 10, &choice))
>>>> +        return -EINVAL;
>>>> +    switch (choice) {
>>>> +    case 1:
>>>> +        action = PSERIES_WDTF_ACTION_HARD_POWEROFF;
>>>> +        return 0;
>>>> +    case 2:
>>>> +        action = PSERIES_WDTF_ACTION_HARD_RESTART;
>>>> +        return 0;
>>>> +    case 3:
>>>> +        action = PSERIES_WDTF_ACTION_DUMP_RESTART;
>>>> +        return 0;
>>>> +    }
>>>> +    return -EINVAL;
>>>> +}
>>>> +
>>>> +static const struct kernel_param_ops action_ops = {
>>>> +    .get = action_get,
>>>> +    .set = action_set,
>>>> +};
>>>> +module_param_cb(action, &action_ops, NULL, 0444);
>>>
>>>
>>> 0644 here and below?
>>>
>>
>> That would make the module parameters have to be runtime
>> configurable, which does not make sense at least for
>> the two parameters below.
> 
> Agreed.
> 
>> I don't know though if it is really valuable to have all the
>> above code instead of just
>> storing the action numbers and doing the conversion to action
>> once in the probe function. The above code really only
>> makes sense if the action is changeable during runtime and more
>> is done that just converting it to another value.
> 
> Having a setter that runs exactly once during module attach is
> obvious.  We need a corresponding .get() method to convert on the way
> out anyway.
> 

Why would a get method be needed if the module parameter is just kept as-is ?

> I don't see any upside to moving the action_set() code into
> pseries_wdt_probe() aside from maybe shaving a few SLOC.  The module
> is already very compact.
> 

I disagree. The get method is unnecessary. The module parameter values (1..3)
add unnecessary complexity. It could as well be 0..2, making it easier to convert.
The actual action could be stored in struct pseries_wdt, or converted using something
like

u8 pseries_actions[] = {
	PSERIES_WDTF_ACTION_HARD_POWEROFF,
	PSERIES_WDTF_ACTION_HARD_RESTART,
	PSERIES_WDTF_ACTION_DUMP_RESTART
};

	flags = pseries_actions[action] | PSERIES_WDTF_OP_START;

or, alternatively, in probe

	if (action > 2)
		return -EINVAL;
	pw->action = pseries_actions[action];
and, in the start function,
	flags = pw->action | PSERIES_WDTF_OP_START;

That not only reduces code size but also improves readability.
get/set methods are useful, but should be limited to cases where they
are really needed, ie do something besides converting values. You could argue
that you want to be able to change the reboot method on the fly, by making
the module parameter writeable, but then the .set method should actually
change the method accordingly and not just convert values. And even then
I'd argue that it would be better not to convert the 'action' value itself
but to keep it at 0, 1, 2 (or 1, 2, 3 if you prefer) and use param_get_uint
(or param_get_ulong) for the get method.

Regarding max_timeout, we have calculations such as

	unsigned int t = wdd->timeout * 1000;

in the assumption that timeouts larger than UINT_MAX/1000 seconds (or ~50 days)
don't really make much sense. watchdog_timeout_invalid() will also return -EINVAL
if the provided timeout value is larger than UINT_MAX / 1000.

Guenter
