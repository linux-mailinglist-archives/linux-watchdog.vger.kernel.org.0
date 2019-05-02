Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F0AA112326
	for <lists+linux-watchdog@lfdr.de>; Thu,  2 May 2019 22:24:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726022AbfEBUXy (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 2 May 2019 16:23:54 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:46442 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725962AbfEBUXy (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 2 May 2019 16:23:54 -0400
Received: by mail-pg1-f195.google.com with SMTP id n2so1552210pgg.13;
        Thu, 02 May 2019 13:23:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=1kO1Q8xyPeInFEuVa9YrVjPZKrqRQhoH5hWqL6piNVQ=;
        b=kY9LQyUGqZ0FVr/++HvUx4Y7nQFfpaOv8Q7FRLpg2RY0aG5pNS01losjKp9fpNP90Z
         VgTVYGgsKsoaTcpQ/e4d5paVJ30k0qLBxIs0xZbbCm1zVwVvBMHvziwUl17b6rZBkVRf
         p526iPe00uoy3h30NHZUkqJ4LbvdULvtN+gFmBIiw63aSiTpVoqlWFRz4wyIGqGV6CwP
         mBQ2DLGmY00I6xkuj3qxlMgPF/Au6ThLvqDR6R8EhSe9OAlEe1v4WRHHWxMpuUCmYJwn
         MzXNdUJ0+ZWuXBrXm77sDeeIGFXUY1Ds85h2pvB96SnlvL38Nyb8iMHX5gooQwLCLb3s
         OaWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=1kO1Q8xyPeInFEuVa9YrVjPZKrqRQhoH5hWqL6piNVQ=;
        b=hTfigpVDU+C6LK//YxdvmL7DZbS/HqBxrP03YvFBezZifhJ7DCJoVM43zPaiARbk8k
         a+FtzUTGi+YR0HX7wYN3Pf0f1+skK6CV4rgSf+JSamajmxnVOwcq8mBBsUh5WN++/lsh
         YVtKH6tTtXIehY+pzOu3cPqGREZgLATmLEIh/mSZJq2oCyGTveIU5wI2uwyiJXW5YdnP
         XcWQ2x0khU6iFE+stVUQ9KoWNJj4CDKLPDYMe5S9A+qZJUDnv2IkP3DzpaaetHaaoKbL
         o8oM1WMXF0dZ8UW3RHmBjrLjmvmZlZ9vafNIfawzLRIFgBG6w/MZCI3jmN8XOlyUvsGG
         8wHA==
X-Gm-Message-State: APjAAAVW5JL7ijjctQkkD92/qlMF0YeRyseVLGxr1kMK4R76LYJ8jngS
        J5XuTaMg3iIGvm4rwJjqhVs=
X-Google-Smtp-Source: APXvYqz6iymo/ALT6GvocSEczAk4ZxeBc7r9+eHosppkdeZ8l7kIrZ2jQzAKGJzr1yX23EYcVZm0PQ==
X-Received: by 2002:a63:5014:: with SMTP id e20mr6075785pgb.2.1556828633822;
        Thu, 02 May 2019 13:23:53 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id u5sm17161pfm.121.2019.05.02.13.23.52
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 02 May 2019 13:23:53 -0700 (PDT)
Date:   Thu, 2 May 2019 13:23:52 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Ludovic Barre <ludovic.Barre@st.com>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Rob Herring <robh+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH V2 2/3] watchdog: stm32: update return values recommended
 by watchdog kernel api
Message-ID: <20190502202352.GB27894@roeck-us.net>
References: <1556806126-15890-1-git-send-email-ludovic.Barre@st.com>
 <1556806126-15890-3-git-send-email-ludovic.Barre@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1556806126-15890-3-git-send-email-ludovic.Barre@st.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Thu, May 02, 2019 at 04:08:45PM +0200, Ludovic Barre wrote:
> From: Ludovic Barre <ludovic.barre@st.com>
> 
> This patch updates return values on watchdog-kernel-api.txt:
> return 0 on succes, -EINVAL for "parameter out of range"
> and -EIO for "could not write value to the watchdog".
> 
> Signed-off-by: Ludovic Barre <ludovic.barre@st.com>
> ---
>  drivers/watchdog/stm32_iwdg.c | 21 +++++++++++++--------
>  1 file changed, 13 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/watchdog/stm32_iwdg.c b/drivers/watchdog/stm32_iwdg.c
> index e191bd8..f19a6d4 100644
> --- a/drivers/watchdog/stm32_iwdg.c
> +++ b/drivers/watchdog/stm32_iwdg.c
> @@ -81,7 +81,6 @@ static int stm32_iwdg_start(struct watchdog_device *wdd)
>  	struct stm32_iwdg *wdt = watchdog_get_drvdata(wdd);
>  	u32 val = FLAG_PVU | FLAG_RVU;
>  	u32 reload;
> -	int ret;
>  
>  	dev_dbg(wdd->parent, "%s\n", __func__);
>  
> @@ -98,13 +97,11 @@ static int stm32_iwdg_start(struct watchdog_device *wdd)
>  	reg_write(wdt->regs, IWDG_KR, KR_KEY_ENABLE);
>  
>  	/* wait for the registers to be updated (max 100ms) */
> -	ret = readl_relaxed_poll_timeout(wdt->regs + IWDG_SR, val,
> -					 !(val & (FLAG_PVU | FLAG_RVU)),
> -					 SLEEP_US, TIMEOUT_US);
> -	if (ret) {
> -		dev_err(wdd->parent,
> -			"Fail to set prescaler or reload registers\n");
> -		return ret;
> +	if (readl_relaxed_poll_timeout(wdt->regs + IWDG_SR, val,
> +				       !(val & (FLAG_PVU | FLAG_RVU)),
> +				       SLEEP_US, TIMEOUT_US)) {
> +		dev_err(wdd->parent, "Fail to set prescaler, reload regs\n");
> +		return -EIO;

Please don't. Overriding error values tends to result in complaints by
static analyzers, and we don't want to have to deal with those.

>  	}
>  
>  	/* reload watchdog */
> @@ -128,8 +125,16 @@ static int stm32_iwdg_ping(struct watchdog_device *wdd)
>  static int stm32_iwdg_set_timeout(struct watchdog_device *wdd,
>  				  unsigned int timeout)
>  {
> +	unsigned int tout = clamp(timeout, wdd->min_timeout,
> +				  wdd->max_hw_heartbeat_ms / 1000);
> +
>  	dev_dbg(wdd->parent, "%s timeout: %d sec\n", __func__, timeout);
>  
> +	if (tout != timeout) {
> +		dev_err(wdd->parent, "parameter out of range\n");
> +		return -EINVAL;
> +	}

This is simply wrong. The whole point of max_hw_heartbeat_ms is to
enable situations where the selected timeout is larger than the
timeout supported by the hardware. In that situation, the kernel
pings the hardware until the next ping from userspace is due.

> +
>  	wdd->timeout = timeout;
>  
>  	if (watchdog_active(wdd))
> -- 
> 2.7.4
> 
