Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 11A582A3D21
	for <lists+linux-watchdog@lfdr.de>; Tue,  3 Nov 2020 08:06:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725968AbgKCHGH (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 3 Nov 2020 02:06:07 -0500
Received: from pegase1.c-s.fr ([93.17.236.30]:2565 "EHLO pegase1.c-s.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725958AbgKCHGG (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 3 Nov 2020 02:06:06 -0500
Received: from localhost (mailhub1-int [192.168.12.234])
        by localhost (Postfix) with ESMTP id 4CQLRF59cFz9vCyQ;
        Tue,  3 Nov 2020 08:06:01 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
        by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
        with ESMTP id dy9O089jaZQ3; Tue,  3 Nov 2020 08:06:01 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
        by pegase1.c-s.fr (Postfix) with ESMTP id 4CQLRF3rlfz9vCyP;
        Tue,  3 Nov 2020 08:06:01 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
        by messagerie.si.c-s.fr (Postfix) with ESMTP id 458018B783;
        Tue,  3 Nov 2020 08:06:02 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
        by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
        with ESMTP id UlvOiLioe_Vf; Tue,  3 Nov 2020 08:06:02 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
        by messagerie.si.c-s.fr (Postfix) with ESMTP id 9D42E8B77E;
        Tue,  3 Nov 2020 08:06:01 +0100 (CET)
Subject: Re: [PATCH -next v2 1/2] watchdog: Clean up error handlings of
 __watchdog_register_device
To:     Wang Wensheng <wangwensheng4@huawei.com>, wim@linux-watchdog.org,
        linux@roeck-us.net, linux-watchdog@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     rui.xiang@huawei.com, guohanjun@huawei.com
References: <20201103065217.67876-1-wangwensheng4@huawei.com>
From:   Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <11e45cab-108f-db0e-6350-82ae49ed6b23@csgroup.eu>
Date:   Tue, 3 Nov 2020 08:05:56 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <20201103065217.67876-1-wangwensheng4@huawei.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi,

Can you provide in the commit a description of what you are doing and why ?

Christophe

Le 03/11/2020 à 07:52, Wang Wensheng a écrit :
> Signed-off-by: Wang Wensheng <wangwensheng4@huawei.com>
> ---
>   drivers/watchdog/watchdog_core.c | 17 ++++++++++-------
>   1 file changed, 10 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/watchdog/watchdog_core.c b/drivers/watchdog/watchdog_core.c
> index 423844757812..c73871f41142 100644
> --- a/drivers/watchdog/watchdog_core.c
> +++ b/drivers/watchdog/watchdog_core.c
> @@ -252,10 +252,8 @@ static int __watchdog_register_device(struct watchdog_device *wdd)
>   		wdd->id = id;
>   
>   		ret = watchdog_dev_register(wdd);
> -		if (ret) {
> -			ida_simple_remove(&watchdog_ida, id);
> -			return ret;
> -		}
> +		if (ret)
> +			goto id_remove;
>   	}
>   
>   	/* Module parameter to force watchdog policy on reboot. */
> @@ -273,9 +271,7 @@ static int __watchdog_register_device(struct watchdog_device *wdd)
>   		if (ret) {
>   			pr_err("watchdog%d: Cannot register reboot notifier (%d)\n",
>   			       wdd->id, ret);
> -			watchdog_dev_unregister(wdd);
> -			ida_simple_remove(&watchdog_ida, id);
> -			return ret;
> +			goto dev_unregister;
>   		}
>   	}
>   
> @@ -289,6 +285,13 @@ static int __watchdog_register_device(struct watchdog_device *wdd)
>   	}
>   
>   	return 0;
> +
> +dev_unregister:
> +	watchdog_dev_unregister(wdd);
> +id_remove:
> +	ida_simple_remove(&watchdog_ida, id);
> +
> +	return ret;
>   }
>   
>   /**
> 
