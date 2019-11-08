Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 94D08F4E08
	for <lists+linux-watchdog@lfdr.de>; Fri,  8 Nov 2019 15:24:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726485AbfKHOYp (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 8 Nov 2019 09:24:45 -0500
Received: from mail-pl1-f196.google.com ([209.85.214.196]:34669 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726462AbfKHOYp (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 8 Nov 2019 09:24:45 -0500
Received: by mail-pl1-f196.google.com with SMTP id k7so4162582pll.1;
        Fri, 08 Nov 2019 06:24:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=JSdryO8eXVojEIgiGi6/MOU8GHzrDfHfveNE8M0VA90=;
        b=AtUZYW3J0oNtdFnuggazotKKoiYQGbkNOGQNhTI8Ly7D7GuZ+mwqFssMKhSS2pY2oy
         KRcxfbsGCuX780NlynrPwAY3ssLO98dF1QR+l6Tlv5x5F3YkUg6TuDmjDZY3ln890zbe
         qYXaAD7vETGYXBFSgLVmRiTD/f//Ma5ytkiPocr4yK4ySZQrDupogLO5XB/LtvEtbXPi
         eaG4WWlsxrl/n6pm5lCCo1DWbzLpUK72QfiIVVP/TqBxUjKZ8IWccydNIWr01IxljNmT
         jETtSto8V+BUNQnlXLK5nGgOEjqFB10xi3ODQPxMqGosbhfzTnfa9LHXP5orMhg8Ti/N
         h8cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=JSdryO8eXVojEIgiGi6/MOU8GHzrDfHfveNE8M0VA90=;
        b=QgZtyrr744fR38N10f4IxKhoygev/m8lzEKQjaoeb1yEP+V2Yog42jdKg4J0kQJtNZ
         B+wFop5NrYZjn5nU6UbpDdYx2lKVQAbZloAbT5IQwdVOaPDxjAAXFNCtuBZKEyvDpJES
         GxC3XZncLpRf5usfiqyoS4z/Q4reqOOjXg5axC1f7hTzEyEI4KbPWtnwNTl//ey43iMJ
         flbz66WRLeLAmKRIXOPd25txMEE4xFVbrIJfGK/YW2Bh+7fPfLG8Ad9ZF6Vcmusnr8iF
         6YhWTbEuV2ypKxsCsI2f1RxETT93FMCZNoBnyWr76dTfoCQXD8z5B+DfHqarKnsLuXQv
         ZbYQ==
X-Gm-Message-State: APjAAAVw1UnVQvi9AszcEKSG7RwVGN7Bnwm0nYSZe7dkFRZAhEaFNX3M
        xF2C55FFhgotC2wVQMrYtiuzBPox
X-Google-Smtp-Source: APXvYqwaeB5xoNb/VifPiYhNFyeGVE4opk7Jr0DWPaz3iNceFwFsDfBcFGrgaDvCmjJC8EsYrVAbDg==
X-Received: by 2002:a17:902:b203:: with SMTP id t3mr10340394plr.51.1573223084656;
        Fri, 08 Nov 2019 06:24:44 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id e59sm9000783pjk.28.2019.11.08.06.24.42
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 08 Nov 2019 06:24:43 -0800 (PST)
Subject: Re: [PATCH] watchdog: sprd: Fix the incorrect pointer getting from
 driver data
To:     Baolin Wang <baolin.wang@linaro.org>, wim@linux-watchdog.org
Cc:     orsonzhai@gmail.com, zhang.lyra@gmail.com, baolin.wang7@gmail.com,
        dongwei.wang@unisoc.com, shuiqing.li@unisoc.com,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
References: <76d4687189ec940baa90cb8d679a8d4c8f02ee80.1573210405.git.baolin.wang@linaro.org>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <3cd61e17-0fd1-6900-47bf-04fcfdef9108@roeck-us.net>
Date:   Fri, 8 Nov 2019 06:24:41 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <76d4687189ec940baa90cb8d679a8d4c8f02ee80.1573210405.git.baolin.wang@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 11/8/19 2:57 AM, Baolin Wang wrote:
> From: Shuiqing Li <shuiqing.li@unisoc.com>
> 
> The device driver data saved the 'struct sprd_wdt' object, it is
> incorrect to get 'struct watchdog_device' object from the driver
> data, thus fix it.
> 
> Fixes: 477603467009 ("watchdog: Add Spreadtrum watchdog driver")
> Reported-by: Dongwei Wang <dongwei.wang@unisoc.com>
> Signed-off-by: Shuiqing Li <shuiqing.li@unisoc.com>
> Signed-off-by: Baolin Wang <baolin.wang@linaro.org>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>   drivers/watchdog/sprd_wdt.c |    6 ++----
>   1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/watchdog/sprd_wdt.c b/drivers/watchdog/sprd_wdt.c
> index 0bb17b0..65cb55f 100644
> --- a/drivers/watchdog/sprd_wdt.c
> +++ b/drivers/watchdog/sprd_wdt.c
> @@ -327,10 +327,9 @@ static int sprd_wdt_probe(struct platform_device *pdev)
>   
>   static int __maybe_unused sprd_wdt_pm_suspend(struct device *dev)
>   {
> -	struct watchdog_device *wdd = dev_get_drvdata(dev);
>   	struct sprd_wdt *wdt = dev_get_drvdata(dev);
>   
> -	if (watchdog_active(wdd))
> +	if (watchdog_active(&wdt->wdd))
>   		sprd_wdt_stop(&wdt->wdd);
>   	sprd_wdt_disable(wdt);
>   
> @@ -339,7 +338,6 @@ static int __maybe_unused sprd_wdt_pm_suspend(struct device *dev)
>   
>   static int __maybe_unused sprd_wdt_pm_resume(struct device *dev)
>   {
> -	struct watchdog_device *wdd = dev_get_drvdata(dev);
>   	struct sprd_wdt *wdt = dev_get_drvdata(dev);
>   	int ret;
>   
> @@ -347,7 +345,7 @@ static int __maybe_unused sprd_wdt_pm_resume(struct device *dev)
>   	if (ret)
>   		return ret;
>   
> -	if (watchdog_active(wdd)) {
> +	if (watchdog_active(&wdt->wdd)) {
>   		ret = sprd_wdt_start(&wdt->wdd);
>   		if (ret) {
>   			sprd_wdt_disable(wdt);
> 

