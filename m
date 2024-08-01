Return-Path: <linux-watchdog+bounces-1445-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E7A5E944EFB
	for <lists+linux-watchdog@lfdr.de>; Thu,  1 Aug 2024 17:19:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 52E5CB24856
	for <lists+linux-watchdog@lfdr.de>; Thu,  1 Aug 2024 15:19:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE9E313C67C;
	Thu,  1 Aug 2024 15:19:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UoMm1p/P"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 517EE13C80C;
	Thu,  1 Aug 2024 15:19:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722525545; cv=none; b=Bbf+e71hBu+1EzTn17no91HQzF/nqItzJBtM4CYjr4EugsQm2Zf2tK1SdbbyQqPwi7PMFZuzi527O1qj3JwbHlttR5Yc1rxb1VrPYaXGTR6XsOf1FzqZVpP3W7KCSKfryKMGreK4F/vIebgUnHJmG8i0j3l07VgQi2UfhpjBTVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722525545; c=relaxed/simple;
	bh=kBIv/ZQwFxdRZ7pTIA4Hf72ts8xAMFoiHWiLBFLvEa8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Drni+VXMo8O/IWpqHOJ2/R4+gPDZ/xlSkGlo51PqIHOPM457yPL0rWzeNVh6FFpFQFH2DWxy+YVCOuM9vvMQyPhQJU8lryxaW0gEC+sNCCEhJvugdQrkH4eHEscIcZ3rLXjLjEUut0umy9szqXizXG2SeyCJazXNIAcHVpIPdsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UoMm1p/P; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-70d2b921cd1so6235098b3a.1;
        Thu, 01 Aug 2024 08:19:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722525542; x=1723130342; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=Pu58lBhmTESvG3dktjusnmQWxj8xq7OpBnGBURrEq1U=;
        b=UoMm1p/PdDiv39PwmqGBztN0P0Jz32Vo5mQAXbhtAmOW1PTJM+/vi5W7gqXHaSuqmv
         jPhHx0HsuClUn9PXhwhgcu7T+wEmb4V7mQ3V1nYgsKFmwqdRadYj+kPue0iYAkqkO+kk
         k6rX1rF4I+P5vxZJ/EHDB9GJU1NdQDvx/h9zy1XUZFQnHZHeLawdaABYAsiV+desdTmn
         v1UNR+q2GcwAjjRXujMYQ0WxcQgnIDhpWd56jfGJa1AbMb409PWhBJD5OzAduU0hLAqh
         FD/QAWBInpvrXuJzvdjeJ6J8BssrW5rQgN6A/7IkqYxzSmTexnwwh5jHklFBM2S4y5P3
         UgHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722525542; x=1723130342;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pu58lBhmTESvG3dktjusnmQWxj8xq7OpBnGBURrEq1U=;
        b=CkKg6E1Ky/y8Jh6GwRDn8HJbaSQ/BUh9xnLkWsE7oI8rLWLP0teeX9kT5OSB1MNB3i
         fcxH47JJJ1pM04RHkrebx+svMsnrecQ1nGBxIgh35iZZGo8E/mYs46Dollo+USavg9bk
         Ssq+bhhmP/Q1xp3AwQkltwhutgYhR6L1jp64nzEJrhALRlmMGnK5tfdCZn8sCaOqcLba
         GREB3/rwkrs+8pb0tR/2EkyvgUCl8fsc6P5BtGMMFM6abQ2wKUtJZhk2XcI8wIONfrR3
         3C+qKSw4ujuQsFDdU1OLK7JYxvAJTfp57GxA5BXrUKms8UfFKvahTg1UozJv1QCusag+
         gtqw==
X-Forwarded-Encrypted: i=1; AJvYcCXDUnCGkLBYRiJDuwYYT3YLZAZFwVTMQyLhQjZBnrFCY7ifofiuOGKAQ97ZdCc76d5Xa2mvX1AfMdia8CIY1IqY+bNsrb1XchNOpuv2/1gV7cvLAYHNkGGHIwPnlmBhIivLgrFw5kJ0hpdkv9E=
X-Gm-Message-State: AOJu0YzFb2YbSoPb/EikC2WEZQZMnranJ10wEwMOFv2WLT6vB8hdNeFB
	EMJlB0nJvNWKQoAFKYujgg5ZhmJp+r775WNCSGyyrBofg5dPV0Bk
X-Google-Smtp-Source: AGHT+IHjXgrKWBmvsfww7ZjV0w1L02xnXpX5YZaz5vYxHzVSHSVqiNofWBdu+YNYfSqJxbVAGimxQw==
X-Received: by 2002:a05:6a20:7346:b0:1c2:94d5:2ee8 with SMTP id adf61e73a8af0-1c6995a1874mr848658637.17.1722525542463;
        Thu, 01 Aug 2024 08:19:02 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70ead816722sm11656486b3a.106.2024.08.01.08.19.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Aug 2024 08:19:01 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <00af4a7d-357f-4bef-8cf9-7d1f8790cc3f@roeck-us.net>
Date: Thu, 1 Aug 2024 08:19:00 -0700
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2] watchdog: xilinx_wwdt: Calculate max_hw_heartbeat_ms
 using clock frequency
To: Harini T <harini.t@amd.com>, michal.simek@amd.com,
 srinivas.neeli@amd.com, shubhrajyoti.datta@amd.com
Cc: srinivas.goud@amd.com, wim@linux-watchdog.org,
 linux-watchdog@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, git@amd.com
References: <20240715053537.290064-1-harini.t@amd.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20240715053537.290064-1-harini.t@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/14/24 22:35, Harini T wrote:
> In the current implementation, the value of max_hw_heartbeat_ms is set
> to the timeout period expressed in milliseconds and fails to verify if
> the close window percentage exceeds the maximum value that the hardware
> supports.
> 
> 1. Calculate max_hw_heartbeat_ms based on input clock frequency.
> 2. Limit the close and open window percent to hardware supported value
> to avoid truncation.
> 3. If the user input timeout exceeds the maximum timeout supported,
> use only open window and the framework supports the higher timeouts.
> 
> Fixes: 12984cea1b8c ("watchdog: xilinx_wwdt: Add Versal window watchdog support")
> 
> Signed-off-by: Harini T <harini.t@amd.com>
> ---
> 
> Changes in V2:
> - Modify the implementation to make the timeout independent of the
>    maximum hardware timeout as the framework supports it.
> - Modify the implementation to obtain ticks from milliseconds instead of
>    ticks from seconds to avoid the minor time difference between hardware
>    and software.
> - Limit the close and open window percentage to hardware supported value
>    to avoid truncation.
> - If the timeout exceeds the maximum timeout supported, use only open
>    window and set the min_hw_heartbeat_ms to zero.
> - Modify the commit title and description.
> - Add Fixes tag in commit description.
> 
> V1 link: https://lore.kernel.org/all/20240319111219.21094-1-harini.t@amd.com/
> 
> ---
>   drivers/watchdog/xilinx_wwdt.c | 70 +++++++++++++++++++++++++++++-----
>   1 file changed, 60 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/watchdog/xilinx_wwdt.c b/drivers/watchdog/xilinx_wwdt.c
> index d271e2e8d6e2..94a8a0275cd8 100644
> --- a/drivers/watchdog/xilinx_wwdt.c
> +++ b/drivers/watchdog/xilinx_wwdt.c
> @@ -36,6 +36,12 @@
>   
>   #define XWWDT_CLOSE_WINDOW_PERCENT	50
>   
> +/* Maximum count value of each 32 bit window */
> +#define XWWDT_MAX_COUNT_WINDOW		GENMASK(31, 0)
> +
> +/* Maximum count value of closed and open window combined */
> +#define XWWDT_MAX_COUNT_WINDOW_COMBINED	GENMASK_ULL(32, 1)
> +
>   static int wwdt_timeout;
>   static int closed_window_percent;
>   
> @@ -54,6 +60,8 @@ MODULE_PARM_DESC(closed_window_percent,
>    * @xilinx_wwdt_wdd: watchdog device structure
>    * @freq: source clock frequency of WWDT
>    * @close_percent: Closed window percent
> + * @closed_timeout: Closed window timeout in ticks
> + * @open_timeout: Open window timeout in ticks
>    */
>   struct xwwdt_device {
>   	void __iomem *base;
> @@ -61,27 +69,22 @@ struct xwwdt_device {
>   	struct watchdog_device xilinx_wwdt_wdd;
>   	unsigned long freq;
>   	u32 close_percent;
> +	u64 closed_timeout;
> +	u64 open_timeout;
>   };
>   
>   static int xilinx_wwdt_start(struct watchdog_device *wdd)
>   {
>   	struct xwwdt_device *xdev = watchdog_get_drvdata(wdd);
>   	struct watchdog_device *xilinx_wwdt_wdd = &xdev->xilinx_wwdt_wdd;
> -	u64 time_out, closed_timeout, open_timeout;
>   	u32 control_status_reg;
>   
> -	/* Calculate timeout count */
> -	time_out = xdev->freq * wdd->timeout;
> -	closed_timeout = div_u64(time_out * xdev->close_percent, 100);
> -	open_timeout = time_out - closed_timeout;
> -	wdd->min_hw_heartbeat_ms = xdev->close_percent * 10 * wdd->timeout;
> -
>   	spin_lock(&xdev->spinlock);
>   
>   	iowrite32(XWWDT_MWR_MASK, xdev->base + XWWDT_MWR_OFFSET);
>   	iowrite32(~(u32)XWWDT_ESR_WEN_MASK, xdev->base + XWWDT_ESR_OFFSET);
> -	iowrite32((u32)closed_timeout, xdev->base + XWWDT_FWR_OFFSET);
> -	iowrite32((u32)open_timeout, xdev->base + XWWDT_SWR_OFFSET);
> +	iowrite32((u32)xdev->closed_timeout, xdev->base + XWWDT_FWR_OFFSET);
> +	iowrite32((u32)xdev->open_timeout, xdev->base + XWWDT_SWR_OFFSET);
>   
>   	/* Enable the window watchdog timer */
>   	control_status_reg = ioread32(xdev->base + XWWDT_ESR_OFFSET);
> @@ -133,7 +136,12 @@ static int xwwdt_probe(struct platform_device *pdev)
>   	struct watchdog_device *xilinx_wwdt_wdd;
>   	struct device *dev = &pdev->dev;
>   	struct xwwdt_device *xdev;
> +	u64 max_per_window_ms;
> +	u64 min_per_window_ms;
> +	u64 timeout_count;
>   	struct clk *clk;
> +	u64 timeout_ms;

Why u64 ? If that is really needed it would result in overflows
throughout the watchdog subsystem, which assumes that the timeout
is not larger than UINT_MAX / 1000.

> +	u64 ms_count;
>   	int ret;
>   
>   	xdev = devm_kzalloc(dev, sizeof(*xdev), GFP_KERNEL);
> @@ -159,7 +167,8 @@ static int xwwdt_probe(struct platform_device *pdev)
>   
>   	xilinx_wwdt_wdd->min_timeout = XWWDT_MIN_TIMEOUT;
>   	xilinx_wwdt_wdd->timeout = XWWDT_DEFAULT_TIMEOUT;
> -	xilinx_wwdt_wdd->max_hw_heartbeat_ms = 1000 * xilinx_wwdt_wdd->timeout;
> +	xilinx_wwdt_wdd->max_hw_heartbeat_ms =
> +		div64_u64(XWWDT_MAX_COUNT_WINDOW_COMBINED, xdev->freq) * 1000;

I don't know if it matters in practice, but this calculation will overflow if
the clock rate is below 2,000 Hz.
>   
>   	if (closed_window_percent == 0 || closed_window_percent >= 100)
>   		xdev->close_percent = XWWDT_CLOSE_WINDOW_PERCENT;
> @@ -167,6 +176,47 @@ static int xwwdt_probe(struct platform_device *pdev)
>   		xdev->close_percent = closed_window_percent;
>   
>   	watchdog_init_timeout(xilinx_wwdt_wdd, wwdt_timeout, &pdev->dev);
> +
> +	/* Calculate ticks for 1 milli-second */
> +	ms_count = div64_u64(xdev->freq, 1000);

Why div64_u64 here ? freq is unsigned long, and dividing it by 1000 will
never require an explicit 64-bit operation.

Overall it seems to me that the generous use of 64-bit operations and
variables raises the risk of overflows. I am not going to verify each
calculation and check for overflows, though. I just hope that it won't
bite you in the future.

> +	timeout_ms = xilinx_wwdt_wdd->timeout * 1000;
> +	timeout_count = timeout_ms * ms_count;
> +
> +	if (timeout_ms > xilinx_wwdt_wdd->max_hw_heartbeat_ms) {
> +		/* To avoid ping restrictions until the minimum hardware heartbeat,
> +		 * we will solely rely on the open window and
> +		 * adjust the minimum hardware heartbeat to 0.
> +		 */

We still use standard multi-line comments in the watchdog subsystem.

> +		xdev->closed_timeout = 0;
> +		xdev->open_timeout = XWWDT_MAX_COUNT_WINDOW;
> +		xilinx_wwdt_wdd->min_hw_heartbeat_ms = 0;
> +		xilinx_wwdt_wdd->max_hw_heartbeat_ms = xilinx_wwdt_wdd->max_hw_heartbeat_ms / 2;
> +	} else {
> +		xdev->closed_timeout  = div64_u64(timeout_count * xdev->close_percent, 100);
> +		xilinx_wwdt_wdd->min_hw_heartbeat_ms =
> +			div64_u64(timeout_ms * xdev->close_percent, 100);
> +
> +		if (timeout_ms > xilinx_wwdt_wdd->max_hw_heartbeat_ms / 2) {
> +			max_per_window_ms = xilinx_wwdt_wdd->max_hw_heartbeat_ms / 2;
> +			min_per_window_ms = timeout_ms - max_per_window_ms;
> +
> +			if (xilinx_wwdt_wdd->min_hw_heartbeat_ms > max_per_window_ms) {
> +				dev_info(xilinx_wwdt_wdd->parent,
> +					 "Closed window cannot be set to %d%%. Using maximum supported value.\n",
> +					xdev->close_percent);
> +				xdev->closed_timeout = max_per_window_ms * ms_count;
> +				xilinx_wwdt_wdd->min_hw_heartbeat_ms = max_per_window_ms;
> +			} else if (xilinx_wwdt_wdd->min_hw_heartbeat_ms < min_per_window_ms) {
> +				dev_info(xilinx_wwdt_wdd->parent,
> +					 "Closed window cannot be set to %d%%. Using minimum supported value.\n",
> +					xdev->close_percent);
> +				xdev->closed_timeout = min_per_window_ms * ms_count;
> +				xilinx_wwdt_wdd->min_hw_heartbeat_ms = min_per_window_ms;
> +			}
> +		}
> +		xdev->open_timeout = timeout_count - xdev->closed_timeout;
> +	}
> +
>   	spin_lock_init(&xdev->spinlock);
>   	watchdog_set_drvdata(xilinx_wwdt_wdd, xdev);
>   	watchdog_set_nowayout(xilinx_wwdt_wdd, 1);


