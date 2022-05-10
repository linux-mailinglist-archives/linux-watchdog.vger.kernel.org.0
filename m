Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 35156522477
	for <lists+linux-watchdog@lfdr.de>; Tue, 10 May 2022 21:00:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233939AbiEJTAa (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 10 May 2022 15:00:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238223AbiEJTAX (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 10 May 2022 15:00:23 -0400
Received: from mail-oa1-x2b.google.com (mail-oa1-x2b.google.com [IPv6:2001:4860:4864:20::2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DDB657124
        for <linux-watchdog@vger.kernel.org>; Tue, 10 May 2022 12:00:21 -0700 (PDT)
Received: by mail-oa1-x2b.google.com with SMTP id 586e51a60fabf-e656032735so180383fac.0
        for <linux-watchdog@vger.kernel.org>; Tue, 10 May 2022 12:00:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:content-language:to
         :cc:references:from:subject:in-reply-to:content-transfer-encoding;
        bh=v5nkQ21aYDQof7wOoAbxM6bfHN8gDiozpmTwlI5AgvA=;
        b=UyUfUHlEviZldrSxpiXdWZCazn3edTOMbuNpv4mVW37GAq/DPZ3SUwIuBSg+LWBSc1
         sGnaXetgQaBkIDjiT4oFwaZNZE+rWfzOrB2iH0fdpH3lAI0oGhuKwPEw8cj7llSEBjFQ
         4wSkv2XXT03J2DOVU9BQB5Ql+UZ/DHKmHQeufHNrPGCaMIki1e9+1vBVvSN/qGJ18cEj
         0FnSpd+U5aAhz3OxAuLBXE58WSk7OCjLGD63XGxPV+Cg2iQF0qhBOrxeyt43UcqGatAI
         AMyst9YcgS8xsgDTadFIutnKCLMxOs6ghwqCa8mHbER74qJWwXF6xJIS2QZ+o8EIWwFB
         U03A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
         :content-language:to:cc:references:from:subject:in-reply-to
         :content-transfer-encoding;
        bh=v5nkQ21aYDQof7wOoAbxM6bfHN8gDiozpmTwlI5AgvA=;
        b=dWPiwsNVAEA5YN6JoYnrOLBmr1M0YMI9nyXzsDFHwSpGzvW6hw9D2D60V5ZDU356EW
         ag1P24yoVmRmdvZObnmc5sT8VEJAno/CQ3yXdzIEYrQa44mMX3Xn1iY5jwUBCNRy4MDP
         6qv+d1kn/+ssNsCxW1uqPT68htGXP0bADBoNJMRxMUqmknxuInohSffqfKuYX+l/OGJh
         +AorcQSaidB2bdByWY9PSvMZOXUCh9QA08mDizRHAImU1HIJUx1pqiPabOKGhTUMK2a+
         NIZgYEXkkkwBd3JvbiT0VB0AWQKJrkVb2bTgebnF++qOl8VeV8AmDC4O+kLxOjHF2lA3
         aHlA==
X-Gm-Message-State: AOAM5325636/Ykk0u0bgs1NMJyUesrHjRimjaqfLXswZFBMIOalebzB/
        tN4nomc3MIGxuHjOym/HJ4M=
X-Google-Smtp-Source: ABdhPJxVapPImscISj1/EfpywhyjLZhSC9EAloxl5nqOCdBvAN7O4j1ExSGAzLIwIPuVjDy/GFXAkw==
X-Received: by 2002:a05:6870:b010:b0:e5:ff56:61d1 with SMTP id y16-20020a056870b01000b000e5ff5661d1mr875513oae.47.1652209220953;
        Tue, 10 May 2022 12:00:20 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id bd40-20020a056808222800b0032694a9925esm4488161oib.10.2022.05.10.12.00.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 May 2022 12:00:20 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <127f1651-b316-16e7-ab7f-35ea03957d89@roeck-us.net>
Date:   Tue, 10 May 2022 12:00:17 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-US
To:     Scott Cheloha <cheloha@linux.ibm.com>
Cc:     Tzung-Bi Shih <tzungbi@kernel.org>, linux-watchdog@vger.kernel.org,
        brking@linux.ibm.com, Nathan Lynch <nathanl@linux.ibm.com>,
        aik@ozlabs.ru, npiggin@gmail.com, vaishnavi@linux.ibm.com,
        wvoigt@us.ibm.com
References: <20220509174357.5448-1-cheloha@linux.ibm.com>
 <20220509174357.5448-3-cheloha@linux.ibm.com> <YnnPdv+Hh9UEHMu/@google.com>
 <7D3AFBE4-ECDF-4CBC-9B3F-55AD62C18A3C@linux.ibm.com>
 <628a1540-4768-61ca-27e1-b6507cc00086@roeck-us.net>
 <E5A89482-D089-4634-9FC0-78464D00F968@linux.ibm.com>
From:   Guenter Roeck <linux@roeck-us.net>
Subject: Re: [RFC v2 2/2] watchdog: pseries-wdt: initial support for PAPR
 virtual watchdog timers
In-Reply-To: <E5A89482-D089-4634-9FC0-78464D00F968@linux.ibm.com>
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

On 5/10/22 09:15, Scott Cheloha wrote:
> 
> 
>> On May 10, 2022, at 11:04 AM, Guenter Roeck <linux@roeck-us.net> wrote:
>>
>> On 5/10/22 08:48, Scott Cheloha wrote:
>>>> On May 9, 2022, at 9:35 PM, Tzung-Bi Shih <tzungbi@kernel.org> wrote:
>>>>
>>>> On Mon, May 09, 2022 at 12:43:57PM -0500, Scott Cheloha wrote:
>>>>> +#define SETFIELD(_v, _b, _e)	\
>>>>> + (((unsigned long)(_v) << PPC_BITLSHIFT(_e)) & PPC_BITMASK((_b), (_e)))
>>>>> +#define GETFIELD(_v, _b, _e)	\
>>>>> + (((unsigned long)(_v) & PPC_BITMASK((_b), (_e))) >> PPC_BITLSHIFT(_e))
>>>>
>>>>  From `./scripts/checkpatch.pl --strict`:
>>>> WARNING: please, no spaces at the start of a line
>>>>
>>>>> +#define PSERIES_WDTQL_MUST_STOP 	1
>>>>
>>>>  From `./scripts/checkpatch.pl --strict`:
>>>> WARNING: please, no space before tabs
>>>>
>>>>> +static const struct kernel_param_ops action_ops = { .set = action_set };
>>>>> +module_param_cb(action, &action_ops, NULL, S_IRUGO);
>>>>
>>>>  From `./scripts/checkpatch.pl --strict`:
>>>> WARNING: Symbolic permissions 'S_IRUGO' are not preferred. Consider using
>>>> octal permissions '0444'.
>>>>
>>>>> +MODULE_PARM_DESC(action, "Action taken when watchdog expires: \"hard-poweroff\", \"hard-restart\", or \"dump-restart\" (default=\"hard-restart\")");
>>>>
>>>> The line exceeds 100 columns.
>>> I was under the impression that strings were an exception to the
>>> line-length rule. Is that not the case?
>> You can use
>>
>> MODULE_PARM_DESC(action,
>> 		 "Some text");
> 
> The line is still over 100 columns if I do this.
> 

You might consider using shorter strings, such as "poweroff", "restart",
"dump". The meaning needs to be documented anyway. You could also drop
"or" because it doesn't add value in this context, and the '"' don't really
add value either.

On a side note, personally I don't like textual module parameters because
they make the command line extremely long and add complexity to decoding
it, but that is your call and responsibility (and you are not the only one
using strings).

Guenter

> I can shrink the line by removing the valid inputs from the string if 100 columns
> is a hard rule.
> 
> If so, where should I document the valid inputs instead?
> 
> Is Documentation/watchdog/watchdog-parameters.rst a better place for them?
> 

