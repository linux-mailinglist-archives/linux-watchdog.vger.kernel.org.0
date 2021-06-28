Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 697013B5F87
	for <lists+linux-watchdog@lfdr.de>; Mon, 28 Jun 2021 16:02:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230154AbhF1OFU (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 28 Jun 2021 10:05:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230033AbhF1OFU (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 28 Jun 2021 10:05:20 -0400
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com [IPv6:2607:f8b0:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C34B4C061574;
        Mon, 28 Jun 2021 07:02:53 -0700 (PDT)
Received: by mail-oi1-x232.google.com with SMTP id q10so22090044oij.5;
        Mon, 28 Jun 2021 07:02:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=S2kROqwgl8cPNdmfhstU/q/tyoHJM78mDnAPBajYRRc=;
        b=XAyfTdRx1fUjwI8eru9fqI9scUwfPvnOwgmYHIcOZXFlNHdDFQRGTKAyzbUKujIA4D
         bY8GrfDMnybMpL6/cqTOTeQCuj+UmE64HNxmU9T5b8hRCZzptiG9Yll5yFzV+LHc4A9Z
         UsY8dEGrAL+koOm2eCLiCXrvMZsMUuwBnwSW+CghSw9ieNMZbzmMQFgGcC0BDWvxgXHJ
         Miq8GB64UepZzhA1x/SPddQaY24DszWRmasaY4bMYkc3wa5BIJDStTNBnjEeVkj4OAqA
         vph7qYNGY+eoogFm5QfRYaw1ZTWOgIVQ101RNdi8WYPR1QEP+CTnngfXDJTEzX95Kxu4
         YKvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=S2kROqwgl8cPNdmfhstU/q/tyoHJM78mDnAPBajYRRc=;
        b=rKvSUuOHDWHrYlwgy+A4pbv5mOC53TgrKwQsmLcE+BCuMDRQ9Qu+3lAjkbw62pAXRq
         3Rli5iM9CRyzpzcu85dZagDVVR/qh/RN3Bf1YOscyuIEH1QuHk8RJoQv5xjik7Li6uaC
         14M2Gd/3s5K3BtZLmA/QM484kUfyS89BbsVdUQ4zxRMg9jDX4dhiZNBLrbkncdftSLmE
         RcANwArvMfTGh9ENcS2xFDHn/LK6QaTTzu7in1UPpBPVm/2fCvxecQyd9TWi2NNx9f62
         UQY8BR3OMYmTnTvztLnK5S7r0GwEmBLg7deLpfC/azvaMdPIlwe28akva7c3lgQxVzOB
         xxZA==
X-Gm-Message-State: AOAM531dKCmJVeMxyHP3XENbQW6wU12so4KmrfN/sWpaCjChqTs2XK1i
        sv8iJ/Tw3x4vD230XCmnsPo=
X-Google-Smtp-Source: ABdhPJxX65pl2aXCpAaliNKZMvUN0Z8RRBZL5KgBTXUloBQZwhNpj4kIdP4zLSwxQDFN+Qb7L/XVRA==
X-Received: by 2002:aca:5dc6:: with SMTP id r189mr21033548oib.164.1624888973104;
        Mon, 28 Jun 2021 07:02:53 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id s187sm3235685oig.6.2021.06.28.07.02.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jun 2021 07:02:52 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Mon, 28 Jun 2021 07:02:51 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
Cc:     wim@linux-watchdog.org, shawnguo@kernel.org,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Michal Koziel <michal.koziel@emlogic.no>
Subject: Re: [PATCH v2 2/2] watchdog: imx2_wdg: notify wdog core to stop ping
 worker on suspend
Message-ID: <20210628140251.GA426379@roeck-us.net>
References: <20210618195033.3209598-1-grzegorz.jaszczyk@linaro.org>
 <20210618195033.3209598-3-grzegorz.jaszczyk@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210618195033.3209598-3-grzegorz.jaszczyk@linaro.org>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Fri, Jun 18, 2021 at 09:50:33PM +0200, Grzegorz Jaszczyk wrote:
> Suspend routine disables wdog clk. Nevertheless, the watchdog subsystem
> is not aware of that and can still try to ping wdog through
> watchdog_ping_work. In order to prevent such condition and therefore
> prevent from system hang (caused by the wdog register access issued
> while the wdog clock is disabled) notify watchdog core that the ping
> worker should be canceled during watchdog core suspend and restored
> during resume.
> 
> Signed-off-by: Michal Koziel <michal.koziel@emlogic.no>
> Signed-off-by: Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
> v1->v2:
> - Do not use watchdog_dev_suspend/resume directly, instead notify the
> watchdog core that the ping worker should be canceled during watchdog
> core suspend and restored during resume.
> - Commit log was updated accordingly.
> ---
>  drivers/watchdog/imx2_wdt.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/watchdog/imx2_wdt.c b/drivers/watchdog/imx2_wdt.c
> index b84f80f7d342..3e8d9c3b6386 100644
> --- a/drivers/watchdog/imx2_wdt.c
> +++ b/drivers/watchdog/imx2_wdt.c
> @@ -311,6 +311,7 @@ static int __init imx2_wdt_probe(struct platform_device *pdev)
>  	watchdog_set_nowayout(wdog, nowayout);
>  	watchdog_set_restart_priority(wdog, 128);
>  	watchdog_init_timeout(wdog, timeout, dev);
> +	watchdog_stop_ping_on_suspend(wdog);
>  
>  	if (imx2_wdt_is_running(wdev)) {
>  		imx2_wdt_set_timeout(wdog, wdog->timeout);
