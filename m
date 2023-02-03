Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CE282688EAB
	for <lists+linux-watchdog@lfdr.de>; Fri,  3 Feb 2023 05:52:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229602AbjBCEwb (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 2 Feb 2023 23:52:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229554AbjBCEwa (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 2 Feb 2023 23:52:30 -0500
Received: from mail-oo1-xc2c.google.com (mail-oo1-xc2c.google.com [IPv6:2607:f8b0:4864:20::c2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1B8C70987
        for <linux-watchdog@vger.kernel.org>; Thu,  2 Feb 2023 20:52:29 -0800 (PST)
Received: by mail-oo1-xc2c.google.com with SMTP id x15-20020a4ab90f000000b004e64a0a967fso394908ooo.2
        for <linux-watchdog@vger.kernel.org>; Thu, 02 Feb 2023 20:52:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=wHbNl6kq5xlAdfzxVK+auQl3I6HnbSeISwlnVlxHC4U=;
        b=eJGXlPVYw2qPXNK3XsxKi2mVSHfGzNhREfrR9YNkUzuv8d2haIvYb3bFaDvSjDg04k
         60DtKUrzP48FerfoifPX/zgyj15MHq30mhXMg7YBsxWOhfZ/Rw4jla6bAft50vkUq5eL
         fa5dcH1w/0mVIdB5OShGHL6BoMOECZOKd7gPQV+Bg/Rzy27NOxoENX04USeGxSyAIQtW
         CY0A8Ev/vygOAkyO43i0215bBSM3bdA7zKKWCVUOa+VFIKiIVPUiIGX4bR4d3j01fBoh
         zSDUcH4tsJPBJt7DamxrOPo0tA6o2tVaHPa2qvkLE7brALdrG68PeaXGziopx/W1l5ft
         zALg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wHbNl6kq5xlAdfzxVK+auQl3I6HnbSeISwlnVlxHC4U=;
        b=nQ84k3heIghGqcZl3s+kmiM3i1vL2brIVsX992sRmcydOdjUbVNF5zbWBuxVARhQck
         5LTkrtJSHJwI7ZcD5xOBpg7W3Be2tuCDOQbBWWWKoxf8ImqZ2gAfZkIbcfsKFcaizjah
         daqMBpQNirgpVAuV19Lp/CNcwc25Fgjb0zVUweONchTOidboI7uJF9cHar5xGR1lIWcQ
         3azE4zW1S4keGDx5ZO83xiosH61O0SsAs9gUJliewD0fNRO0PLq/LwNcaUStdJ3gsApZ
         HxRa+4QzGZt9/spXXcLDID2ZyTvGCXhiiFrbS1SkpXRkb2fEhOeBiNw9j7jkMm0Fes/k
         7lWg==
X-Gm-Message-State: AO0yUKWf0MtOVInZU8XwmzDDY3owpGE6A3QmlW0I/anR6ob3YJJ4Pubz
        HfDHCRzg7Xk1ORwl4aOumYM=
X-Google-Smtp-Source: AK7set99nNOOrXZ06ZWGsqU5NUZWgFPuoodcZHdAleU2C5uVC87rIUJswVPtS+94PIAYcEUiY0iSUg==
X-Received: by 2002:a4a:948e:0:b0:51a:35de:d4c1 with SMTP id k14-20020a4a948e000000b0051a35ded4c1mr1753648ooi.5.1675399948975;
        Thu, 02 Feb 2023 20:52:28 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id r6-20020a4ae5c6000000b005177543fafdsm585314oov.40.2023.02.02.20.52.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Feb 2023 20:52:28 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <e5e8978c-410e-76a7-a541-710da5207132@roeck-us.net>
Date:   Thu, 2 Feb 2023 20:52:26 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH -next] watchdog: diag288_wdt: use kmemdup() to allocate
 memory
Content-Language: en-US
To:     Yang Yingliang <yangyingliang@huawei.com>,
        Heiko Carstens <hca@linux.ibm.com>
Cc:     linux-watchdog@vger.kernel.org, wim@linux-watchdog.org
References: <20230202074127.4108100-1-yangyingliang@huawei.com>
 <Y9u4/amCdKDz5L2J@osiris> <6f80303d-fe26-a2af-a1fa-e99c00da9a81@roeck-us.net>
 <e67f5e87-6fc6-9e16-7354-6fa8464e0b46@huawei.com>
From:   Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <e67f5e87-6fc6-9e16-7354-6fa8464e0b46@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On 2/2/23 18:40, Yang Yingliang wrote:
> 
> On 2023/2/2 21:35, Guenter Roeck wrote:
>> On 2/2/23 05:22, Heiko Carstens wrote:
>>> On Thu, Feb 02, 2023 at 03:41:27PM +0800, Yang Yingliang wrote:
>>>> Use kmemdup() helper instead of open-coding to simplify
>>>> the code when allocating ebc_cmd.
>>>>
>>>> Generated by: scripts/coccinelle/api/memdup.cocci
>>>>
>>>> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
>>>> ---
>>>>   drivers/watchdog/diag288_wdt.c | 3 +--
>>>>   1 file changed, 1 insertion(+), 2 deletions(-)
>>>
>>> Thanks, but this code will be changed differently with the next merge
>>> window. Therefore I will not apply patch.
>>
>> It looks like you decided to bypass even sending your patches to the watchdog
>> mailing list. I know I have not been as responsive there as I should be,
>> but that it no reason to bypass the maintainers completely.
> I sent the patch to all the maintainers that get by './scripts/get_maintainer.pl drivers/watchdog/diag288_wdt.c'
> 

I did not refer to your patch, but to Heiko's patch series
(which since has been applied to the mainline kernel).

Guenter

