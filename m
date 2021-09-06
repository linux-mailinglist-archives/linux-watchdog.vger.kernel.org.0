Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA86C401A95
	for <lists+linux-watchdog@lfdr.de>; Mon,  6 Sep 2021 13:30:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231815AbhIFLbT (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 6 Sep 2021 07:31:19 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188]:15386 "EHLO
        szxga02-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231173AbhIFLbS (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 6 Sep 2021 07:31:18 -0400
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.54])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4H35gl6hWGzQssK;
        Mon,  6 Sep 2021 19:26:11 +0800 (CST)
Received: from dggpeml500023.china.huawei.com (7.185.36.114) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Mon, 6 Sep 2021 19:30:04 +0800
Received: from [10.67.77.175] (10.67.77.175) by dggpeml500023.china.huawei.com
 (7.185.36.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.8; Mon, 6 Sep 2021
 19:30:03 +0800
Subject: Re: [PATCH] watchdog: sbsa: only use 32-bit accessors
To:     Jamie Iles <quic_jiles@quicinc.com>,
        <linux-watchdog@vger.kernel.org>
CC:     <wim@linux-watchdog.org>, <linux@roeck-us.net>
References: <20210903112101.493552-1-quic_jiles@quicinc.com>
From:   Shaokun Zhang <zhangshaokun@hisilicon.com>
Message-ID: <2bdf7b81-ca77-bfda-0017-949d70ede5b8@hisilicon.com>
Date:   Mon, 6 Sep 2021 19:30:03 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210903112101.493552-1-quic_jiles@quicinc.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.77.175]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpeml500023.china.huawei.com (7.185.36.114)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi Jamie，

On 2021/9/3 19:21, Jamie Iles wrote:
> SBSA says of the generic watchdog:
> 
>   All registers are 32 bits in size and should be accessed using 32-bit
>   reads and writes. If an access size other than 32 bits is used then
>   the results are IMPLEMENTATION DEFINED.
> 
> and for qemu, the implementation will only allow 32-bit accesses
> resulting in a synchronous external abort when configuring the watchdog.
> Use lo_hi_* accessors rather than a readq/writeq.
> 
> Fixes: abd3ac7902fb ("watchdog: sbsa: Support architecture version 1")
> Signed-off-by: Jamie Iles <quic_jiles@quicinc.com>
> ---
>  drivers/watchdog/sbsa_gwdt.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/watchdog/sbsa_gwdt.c b/drivers/watchdog/sbsa_gwdt.c
> index ee9ff38929eb..6f4319bdbc50 100644
> --- a/drivers/watchdog/sbsa_gwdt.c
> +++ b/drivers/watchdog/sbsa_gwdt.c
> @@ -130,7 +130,7 @@ static u64 sbsa_gwdt_reg_read(struct sbsa_gwdt *gwdt)
>  	if (gwdt->version == 0)
>  		return readl(gwdt->control_base + SBSA_GWDT_WOR);
>  	else
> -		return readq(gwdt->control_base + SBSA_GWDT_WOR);
> +		return lo_hi_readq(gwdt->control_base + SBSA_GWDT_WOR);


My bad, I didn't check this carefully. Please feel free to add：

Reviewed-by: Shaokun Zhang <zhangshaokun@hisilicon.com>

Thanks,
Shaokun

>  }
>  
>  static void sbsa_gwdt_reg_write(u64 val, struct sbsa_gwdt *gwdt)
> @@ -138,7 +138,7 @@ static void sbsa_gwdt_reg_write(u64 val, struct sbsa_gwdt *gwdt)
>  	if (gwdt->version == 0)
>  		writel((u32)val, gwdt->control_base + SBSA_GWDT_WOR);
>  	else
> -		writeq(val, gwdt->control_base + SBSA_GWDT_WOR);
> +		lo_hi_writeq(val, gwdt->control_base + SBSA_GWDT_WOR);
>  }
>  
>  /*
> 
