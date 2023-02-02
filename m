Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CB7F3687EC5
	for <lists+linux-watchdog@lfdr.de>; Thu,  2 Feb 2023 14:35:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231889AbjBBNfr (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 2 Feb 2023 08:35:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230011AbjBBNfp (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 2 Feb 2023 08:35:45 -0500
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com [IPv6:2607:f8b0:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B9E279CA6
        for <linux-watchdog@vger.kernel.org>; Thu,  2 Feb 2023 05:35:44 -0800 (PST)
Received: by mail-ot1-x336.google.com with SMTP id 70-20020a9d084c000000b0068bccf754f1so457564oty.7
        for <linux-watchdog@vger.kernel.org>; Thu, 02 Feb 2023 05:35:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=FcBD3hjbvg+WV4DwonVKoKD5PAVKnVdJKiAy+LjxwFQ=;
        b=khmhg8Vklg1cXqlp0ljUuNCfQbayM26L1K6zE3xPCFn07Ca5P24RkXWiXqazp/fyp4
         +vPZGFuDYcT4oCsmp94q/dXlsFC582qyyPeGE9hExt+SUN6agmE7eRq5QlZcB+RGtatV
         yNyZlDArNiH8ix+6dlARcFjJBruDfx5QpY+kVapnKymWEMhi0OvI4zF3w4zvhcWyfpLg
         YAANwacaeYZn4N7MFjRpUsLGdWTKR3Lyetwa22lheS9lQK69bKRjQiSWmhmcgY/vOGjx
         Uyq+gQ/2ZFJa1tFpPkX3u6R8VwV2FJxdftoH8lYEzIyc3XhmxLXQpaoCdmegNMiY07q4
         u6DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FcBD3hjbvg+WV4DwonVKoKD5PAVKnVdJKiAy+LjxwFQ=;
        b=d8rCLPLL6sJ7wTMMtF5jW4oSd5tDS4uGkfjvZtkhvSKaT8u2KFbGA1kDoTmSkJaBiK
         83vxlYy/g+1HMqrdYVBeNshFMgULRUlmXq5l+Pg/Tfyt2WxmeTSqUx+o9Ro5hazM0uE5
         DNDB+2Rl5MkJz0Wc3T6GMk5K4X1Y/AoB8TiBSbFKJmIGL0pfGbO8lMRWoRsELADwqf1z
         vfidnvlruruXQ+QqDALoosv0VH3c/JXnegT0zZmvzYp7Tf49T9rmkE+w4/Ne5MiCmTty
         fDisHUtLvMnpIdXQmCDyrAmQMCthdXOxizwPLsRkzBArGBGoMK+IWR34sQJ2IMING5Xi
         7g9w==
X-Gm-Message-State: AO0yUKWILzZ1HNshwUy7ilU6cdUzELIMa9UAuppuj1+Gpa6TrD4RSW+k
        mRxcNULRnVG2tHM3Ui4pSUHjnMqNOv8=
X-Google-Smtp-Source: AK7set+CTBeqyoeDtwNfnU+Dc6sHJMxmlFzNUZVpVcNR2t46aD4tQGneKf46pmr4yqFIkcvlDCFfng==
X-Received: by 2002:a9d:4711:0:b0:68b:e2a3:8f2d with SMTP id a17-20020a9d4711000000b0068be2a38f2dmr3279610otf.34.1675344943558;
        Thu, 02 Feb 2023 05:35:43 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id p5-20020a056830318500b0068bce0cd4e1sm5325969ots.9.2023.02.02.05.35.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Feb 2023 05:35:42 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <6f80303d-fe26-a2af-a1fa-e99c00da9a81@roeck-us.net>
Date:   Thu, 2 Feb 2023 05:35:40 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH -next] watchdog: diag288_wdt: use kmemdup() to allocate
 memory
Content-Language: en-US
To:     Heiko Carstens <hca@linux.ibm.com>,
        Yang Yingliang <yangyingliang@huawei.com>
Cc:     linux-watchdog@vger.kernel.org, wim@linux-watchdog.org
References: <20230202074127.4108100-1-yangyingliang@huawei.com>
 <Y9u4/amCdKDz5L2J@osiris>
From:   Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <Y9u4/amCdKDz5L2J@osiris>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 2/2/23 05:22, Heiko Carstens wrote:
> On Thu, Feb 02, 2023 at 03:41:27PM +0800, Yang Yingliang wrote:
>> Use kmemdup() helper instead of open-coding to simplify
>> the code when allocating ebc_cmd.
>>
>> Generated by: scripts/coccinelle/api/memdup.cocci
>>
>> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
>> ---
>>   drivers/watchdog/diag288_wdt.c | 3 +--
>>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> Thanks, but this code will be changed differently with the next merge
> window. Therefore I will not apply patch.

It looks like you decided to bypass even sending your patches to the watchdog
mailing list. I know I have not been as responsive there as I should be,
but that it no reason to bypass the maintainers completely.

Guenter

