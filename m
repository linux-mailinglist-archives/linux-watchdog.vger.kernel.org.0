Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2AE7130172D
	for <lists+linux-watchdog@lfdr.de>; Sat, 23 Jan 2021 18:27:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725910AbhAWR0x (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 23 Jan 2021 12:26:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725550AbhAWR0w (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 23 Jan 2021 12:26:52 -0500
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com [IPv6:2607:f8b0:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C60BFC06174A;
        Sat, 23 Jan 2021 09:26:11 -0800 (PST)
Received: by mail-oi1-x235.google.com with SMTP id x137so8660746oix.11;
        Sat, 23 Jan 2021 09:26:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Fx0dTn/ibDFiP8TXms9D2tHALPZMdynL/f0uPDryXjQ=;
        b=q5Zlsg1WoDKF5HigG82e/pxLTxUY6SJY+9HDrFuC9EAcR27LgiqN4L5gqWDv67r+7B
         lcusl8aod6r5lP4D/9u5QK5/mfkRTLNSlSRRfkdIW+oz5t2fthyhoJkpsXb9LYGa7B3P
         y+ecpbPvH2FhB12mTmwcIEkZ0vRwh8ehwJF3Vwv5tb8b4shDNE1JClE2oaJEP5pRSSEI
         yZl4gN8eSzzbyKYSXPzHtxhd2z0Ej5RDcJplMV1GZd6KBpmHZ9XP+hzvLiRyEWkEDCS7
         gtUnpImvb4M4qrEue9TCqQfZWS6ju4UiovQQX7HWp3DenYTwnTthqgio+SdOZ5bxuu/3
         69Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=Fx0dTn/ibDFiP8TXms9D2tHALPZMdynL/f0uPDryXjQ=;
        b=Pl7tuOGrdxLxlWCd6oNJDDB57sZXjhhgWBoagFyWSeGJibPO8fQnNyP5M12Yr7Clsl
         yQ8NO4gK0agsPwR6sFYNMnekwOry25mBx134FWXwf5ERbA2NRT2DBAKodymKIb7IEuKO
         h7Fam875nDwsaRhJCLfXRmJQR4YBQ2Km/9L4D1NlNmBwIYYFubv87DnJZvGbMtDxYD3x
         BXyw37JvWmyZ5C+/WwwcDi4nsgqKOV9Bli1Yw3nrNF6iV317/HK0lmuFFOABThazI+5E
         p6YF2YUejFVn+KNPAWge31JrVZY9kWQku2eSIuO/cTJ9V2AQ8SNdf9coUGXa6jSOI5Eh
         NbdA==
X-Gm-Message-State: AOAM533gV5VlGLfTR7kzC+nvyBzwSpRG84p+HkLHXFqPCbE9otYcnimw
        DH1i4MGtUEMFmf8mzk+zxSs=
X-Google-Smtp-Source: ABdhPJz0OColhLeibwBoqtOA1S5cGh5GSWRV0MQuxWn9FfPLDub0hWFKifywOTmLY7ifgl0YMS6mFQ==
X-Received: by 2002:aca:5bd4:: with SMTP id p203mr6873838oib.108.1611422771134;
        Sat, 23 Jan 2021 09:26:11 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id g13sm2392998otr.74.2021.01.23.09.26.10
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 23 Jan 2021 09:26:10 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Sat, 23 Jan 2021 09:26:09 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Qiang Zhao <qiang.zhao@nxp.com>
Cc:     wim@linux-watchdog.org, linux-watchdog@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] watchdog: stop wdd when watchdog hw running in
 reboot_notifier
Message-ID: <20210123172609.GA56545@roeck-us.net>
References: <20210114082651.17162-1-qiang.zhao@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210114082651.17162-1-qiang.zhao@nxp.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Thu, Jan 14, 2021 at 04:26:51PM +0800, Qiang Zhao wrote:
> From: Zhao Qiang <qiang.zhao@nxp.com>
> 
> In watchdog_reboot_notifier, wdd should be stopped when the device
> is in hw_running state
> 
> Signed-off-by: Zhao Qiang <qiang.zhao@nxp.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/watchdog_core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/watchdog/watchdog_core.c b/drivers/watchdog/watchdog_core.c
> index 861daf4..ec670cc 100644
> --- a/drivers/watchdog/watchdog_core.c
> +++ b/drivers/watchdog/watchdog_core.c
> @@ -154,7 +154,7 @@ static int watchdog_reboot_notifier(struct notifier_block *nb,
>  
>  	wdd = container_of(nb, struct watchdog_device, reboot_nb);
>  	if (code == SYS_DOWN || code == SYS_HALT) {
> -		if (watchdog_active(wdd)) {
> +		if (watchdog_active(wdd) || watchdog_hw_running(wdd)) {
>  			int ret;
>  
>  			ret = wdd->ops->stop(wdd);
