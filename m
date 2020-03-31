Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DD52B199B08
	for <lists+linux-watchdog@lfdr.de>; Tue, 31 Mar 2020 18:11:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730149AbgCaQLu (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 31 Mar 2020 12:11:50 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:37570 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727703AbgCaQLt (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 31 Mar 2020 12:11:49 -0400
Received: by mail-pg1-f193.google.com with SMTP id i34so418147pgl.4;
        Tue, 31 Mar 2020 09:11:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=w9aZt5kj5dEodJPJpXH7a5YTDfiFLHJYid+xgTUSEqk=;
        b=gEqZNQgfhN4RRt0lF/OEy9kx/LD/Nhw7gepxbzUe+Dj2K7MQrHvr8mszW9PJJwq7cd
         zAXZAcH+Ur/EWa6r9/MuAI1WqO4faTCjiZBwXmjRLFbv6ciCwrY0dNxdKLo4nxZw8nSa
         MCZKFUX1hkU4a7g3dWGl2HVSjk/xO7mk6CDuYyzU4MXQM2n0iW4M1vCP3nnMDwT6EYqf
         u3pz4GFPxoMS0EvGbg0MUEYlPOPCZLcbQQ//z88cAp6R24kTBNAP6LepeBtdl7ajZBLg
         9Dh9YZ2aO0QB4kAPg/pB6f+99f8SIm92H58TI6XimTawgvwFblrIsoQbsvWtG2I8WFIH
         P7mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=w9aZt5kj5dEodJPJpXH7a5YTDfiFLHJYid+xgTUSEqk=;
        b=BgKWPRHsAPTdHzOOeg4xtI8Z4l/9zkoc9WS1QCPiEEp+WrMZn9jiyeuVeDn+sR+8eb
         JxnyrDzkHlfnzPPxSr17IMHI9mGXyRnL4tPzmkw9cwVsrnCldJ8Ms6f8CtbZ2LuVB1io
         r51sfld2+LhC82+3NfCJhSVwhJFDufY0qAY/iOb1d6B7LASE4XOLFRptjBmyAq09sVla
         xSuUGlkiQfijaqsXXzeNrrut+BGZLsLPn1TFi/KpOas9WRzASHVmeOGGJBzB+DZk6nF/
         1vd+50CZ8P3nZe8uFAeWGzDtqBWIngDL/jw0OefXoWgewckcq58bDMQQMfO/5DBx/+xn
         xcdA==
X-Gm-Message-State: ANhLgQ1JO805OICyvh1D0wciskDCox+EYC1IfAKqmmhJYp11a3vyhPkg
        fWQc9NSc/BB2Aq+uS0pw1J6gyFAT
X-Google-Smtp-Source: ADFU+vuYyprfaK6MnpO5n5k9ZNFba/my0hFDDzPzu7DxGXyclceI+9t3jPhSJk0TM142DDm6hFnARA==
X-Received: by 2002:a63:1660:: with SMTP id 32mr18108713pgw.169.1585671106300;
        Tue, 31 Mar 2020 09:11:46 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id m28sm12068793pgn.7.2020.03.31.09.11.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2020 09:11:45 -0700 (PDT)
Subject: Re: [PATCH 3/3] watchdog: da9062: No need to ping manually before
 setting timeout
To:     Stefan Riedmueller <s.riedmueller@phytec.de>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Support Opensource <support.opensource@diasemi.com>
Cc:     linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200326150203.371673-1-s.riedmueller@phytec.de>
 <20200326150203.371673-3-s.riedmueller@phytec.de>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <6331c612-70f0-5dc6-c3d1-a7a5a72e61fe@roeck-us.net>
Date:   Tue, 31 Mar 2020 09:11:44 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200326150203.371673-3-s.riedmueller@phytec.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 3/26/20 8:02 AM, Stefan Riedmueller wrote:
> There is actually no need to ping the watchdog before disabling it
> during timeout change. Disabling the watchdog already takes care of
> resetting the counter.
> 
> This fixes an issue during boot when the userspace watchdog handler takes
> over and the watchdog is already running. Opening the watchdog in this case
> leads to the first ping and directly after that without the required
> heartbeat delay a second ping issued by the set_timeout call. Due to the
> missing delay this resulted in a reset.
> 
> Signed-off-by: Stefan Riedmueller <s.riedmueller@phytec.de>

Makes sense to me.

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

Guenter

> ---
>  drivers/watchdog/da9062_wdt.c | 5 -----
>  1 file changed, 5 deletions(-)
> 
> diff --git a/drivers/watchdog/da9062_wdt.c b/drivers/watchdog/da9062_wdt.c
> index 6d81b1276b87..c5bd075c8b14 100644
> --- a/drivers/watchdog/da9062_wdt.c
> +++ b/drivers/watchdog/da9062_wdt.c
> @@ -66,11 +66,6 @@ static int da9062_wdt_update_timeout_register(struct da9062_watchdog *wdt,
>  					      unsigned int regval)
>  {
>  	struct da9062 *chip = wdt->hw;
> -	int ret;
> -
> -	ret = da9062_reset_watchdog_timer(wdt);
> -	if (ret)
> -		return ret;
>  
>  	regmap_update_bits(chip->regmap,
>  				  DA9062AA_CONTROL_D,
> 

