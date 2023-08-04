Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4EEBC770516
	for <lists+linux-watchdog@lfdr.de>; Fri,  4 Aug 2023 17:46:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231860AbjHDPqF (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 4 Aug 2023 11:46:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231861AbjHDPqD (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 4 Aug 2023 11:46:03 -0400
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE3142D71
        for <linux-watchdog@vger.kernel.org>; Fri,  4 Aug 2023 08:46:01 -0700 (PDT)
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-686c06b806cso1636833b3a.2
        for <linux-watchdog@vger.kernel.org>; Fri, 04 Aug 2023 08:46:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691163961; x=1691768761;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=QkepDjUYUlIjXDyvmgA0IftVUS+aMxBnf9JOu6FyyS8=;
        b=kekQ0a8Pvp/dsxkBfprAki41CncQ4u3zLusEGbxG9LlRUmA7oJJrA6JpqyQ7FI4k5o
         gm38jyoXEjvMqHj50BkT4vwUIX+rcQO+zkbjYwj1cPtfnXrHkYOMmJ+sJ/oxLwI0i2Og
         MRPKVP0ODwNCgg7KmwxYkV0gj3g3zoGtR6ejhjhbdkNnvXGEGiOym53gOph61WSsANxy
         evHSYkqHB306/zIKWyPdxpuJe4587kRh/r819OwMP3K7qSs/XBUCRMApVL2eOKHPyPv9
         7KTr0alfXoreSAe+7IlxovhOoVz7mu92pFKJe+XbdetwWYHurFllP0SXI33sCMOSRl8O
         iI9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691163961; x=1691768761;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QkepDjUYUlIjXDyvmgA0IftVUS+aMxBnf9JOu6FyyS8=;
        b=BNR8cak6bO+3uwpJbsMSCmjQxGo2P2pTDB8OJUWcJrHJv2BaO783GSEdI/Ew8MoHsZ
         XNxJLVoidTwJLh3Hh6EfhXaQc6/6MvAEvBKyDUxj8ehCZgbxkm1QcQptXINZmMG7WwUH
         c4Phqn0Ja5GKNMt+jtwuq2oghnRIyuBs1+tOwluRw09De1pOAX4+kDJZfW0TnC6LZgXz
         if7f03xqPr0JecgOgSogekUHZw0pHATV8QuKbP7lWpy6Hn4lWP6/siifP3he9yXHveNJ
         k/Pzyzw8VwPEVcW/mgliggVBL9xFD75M7AIrex/dMnp0Tejlr5WihbG8LzhdVRwIliJ6
         ttzg==
X-Gm-Message-State: AOJu0YzyOlNdP/Jpyu3VFbESscvkPg0qU1Ht+jHKqQrx5uq7o2KHIkDk
        i59Yq648+JP+gV4kMKmPGqs=
X-Google-Smtp-Source: AGHT+IFH4X8nDCqnRB7d9X9RU0LEOwa5n0MJe+cwAFuG0Rl7vdXq1BNUWocwS1SovfMJ+Mhxbo+ZBA==
X-Received: by 2002:a05:6a20:a108:b0:13d:d5bd:6985 with SMTP id q8-20020a056a20a10800b0013dd5bd6985mr2040388pzk.12.1691163961295;
        Fri, 04 Aug 2023 08:46:01 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id z70-20020a633349000000b00564bcae8b89sm1072714pgz.9.2023.08.04.08.46.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Aug 2023 08:46:00 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <e15c1e45-494b-af95-0b94-9ac27521fcc1@roeck-us.net>
Date:   Fri, 4 Aug 2023 08:45:59 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH -next] watchdog: menz069_wdt: Remove redundant
 initialization owner in men_z069_driver
Content-Language: en-US
To:     Li Zetao <lizetao1@huawei.com>, jth@kernel.org,
        wim@linux-watchdog.org
Cc:     linux-watchdog@vger.kernel.org
References: <20230804100617.100251-1-lizetao1@huawei.com>
From:   Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <20230804100617.100251-1-lizetao1@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        NICE_REPLY_A,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 8/4/23 03:06, Li Zetao wrote:
> The module_mcb_driver() will set "THIS_MODULE" to driver.owner when
> register a mcb_driver driver, so it is redundant initialization to set
> driver.owner in men_z069_driver statement. Remove it for clean code.
> 
> Signed-off-by: Li Zetao <lizetao1@huawei.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>   drivers/watchdog/menz69_wdt.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/watchdog/menz69_wdt.c b/drivers/watchdog/menz69_wdt.c
> index 3c98030b9fcd..c7de30270043 100644
> --- a/drivers/watchdog/menz69_wdt.c
> +++ b/drivers/watchdog/menz69_wdt.c
> @@ -153,7 +153,6 @@ MODULE_DEVICE_TABLE(mcb, men_z069_ids);
>   static struct mcb_driver men_z069_driver = {
>   	.driver = {
>   		.name = "z069-wdt",
> -		.owner = THIS_MODULE,
>   	},
>   	.probe = men_z069_probe,
>   	.remove = men_z069_remove,

