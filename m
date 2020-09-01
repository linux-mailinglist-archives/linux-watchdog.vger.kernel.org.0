Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 91FEB259F25
	for <lists+linux-watchdog@lfdr.de>; Tue,  1 Sep 2020 21:22:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731910AbgIATWb (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 1 Sep 2020 15:22:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732153AbgIATWT (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 1 Sep 2020 15:22:19 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15330C061244
        for <linux-watchdog@vger.kernel.org>; Tue,  1 Sep 2020 12:22:19 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id j11so1026208plk.9
        for <linux-watchdog@vger.kernel.org>; Tue, 01 Sep 2020 12:22:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=KUXkI0XNPKELmn0LD/tebrpxYn0EKDpBw94PVxBZDNs=;
        b=UHgqxaGgj1CRSigcj292tH4Zz2q9ikxTYdhiJpxomQFg9r1T4rDW789+KhhKmIQHfX
         lcwUOrjEJwt0dLyL+pa1JmKF1KuVEkstH62hmEfCOGbMoDqmc7d9dcia7fRiFguVd5Jy
         jMYHU7BjesNXPy6luo1zvF0MOq4+BCWX0zJk8P2HOJbQuWtsx/RJcuRqJmgqNIqaQb/U
         +t5bCFJUiTa+3ILi0Wh8T4qlLy0HW0+N6ZiIZdzHbxIyL/4PIlPIE+AmRDROfzt0Lsc8
         SX3Nl5VWKLz9qX30ILyA/qO42We8RGaAvfHvsU4XMcEYsqdPVRVh55faZ0Kd6a0f1esh
         g7gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=KUXkI0XNPKELmn0LD/tebrpxYn0EKDpBw94PVxBZDNs=;
        b=oCXrqmDgdZxjNH7szjuheFAVfkdTozTsdqc4zmmC+015EroOzTCB7q3e7/rVgVgUwh
         6cNdRhdp7VOM9WMg8njb43GhpzX/oqsA8OzLrUsdgSnyrqJf84T1MGuZmdkEmvqAVowz
         wx29AXMXiixtxZrDhFZu/PQnVPJNRSeR8MtQmfCWhcjwAvVaHLwgy7Fow1mIsPMuSxIr
         mK0UzfDnOsyrffWgPJnu+qArYTOZ/RGWl2EgLg7so6HFOmVE5Sik/zRenQK51aOsyPPV
         rosOTigmiIqpw7q2ma6tZ3PTOhg9ZVzEgRp07zTwgNR54ecH+siGmXJKFkWhwOliebnl
         aXYg==
X-Gm-Message-State: AOAM531Gs3Ig/vQmWdJU0xERmNwGnmTPd6EzwABTuB84G1RM9MMU4m9b
        rc5e70dhNl6zla9MDZj0+34Pdnvok8A=
X-Google-Smtp-Source: ABdhPJzPhiZiSq14+JTroX+7dsYRd/1CaqZE1T16vep4VpQu6WCz7+jG9GRlJneviKPkU2/fv1wAHg==
X-Received: by 2002:a17:90a:a102:: with SMTP id s2mr2866130pjp.55.1598988138606;
        Tue, 01 Sep 2020 12:22:18 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 5sm2980372pfw.25.2020.09.01.12.22.16
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 01 Sep 2020 12:22:17 -0700 (PDT)
Date:   Tue, 1 Sep 2020 12:22:16 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hanspeter Portner <hanspeter.portner@livesystems.ch>
Cc:     wim@linux-watchdog.org, linux-watchdog@vger.kernel.org,
        Hanspeter Portner <dev@open-music-kontrollers.ch>
Subject: Re: [PATCH] watchdog: it87_wdt: add IT8772 ID
Message-ID: <20200901192216.GA138243@roeck-us.net>
References: <20200827105940.2835910-1-hanspeter.portner@livesystems.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200827105940.2835910-1-hanspeter.portner@livesystems.ch>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Thu, Aug 27, 2020 at 12:59:40PM +0200, Hanspeter Portner wrote:
> IT8772 watchdog works as in IT872x
> 
> Tested on SHAREVDI K6-F12 board.
> 
> Signed-off-by: Hanspeter Portner <dev@open-music-kontrollers.ch>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/it87_wdt.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/watchdog/it87_wdt.c b/drivers/watchdog/it87_wdt.c
> index f3bf3ea50e39..2dac0ba551ce 100644
> --- a/drivers/watchdog/it87_wdt.c
> +++ b/drivers/watchdog/it87_wdt.c
> @@ -15,7 +15,7 @@
>   *	Support of the watchdog timers, which are available on
>   *	IT8607, IT8620, IT8622, IT8625, IT8628, IT8655, IT8665, IT8686,
>   *	IT8702, IT8712, IT8716, IT8718, IT8720, IT8721, IT8726, IT8728,
> - *	and IT8783.
> + *	IT8772 and IT8783.
>   */
>  
>  #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> @@ -66,6 +66,7 @@
>  #define IT8721_ID	0x8721
>  #define IT8726_ID	0x8726	/* the data sheet suggest wrongly 0x8716 */
>  #define IT8728_ID	0x8728
> +#define IT8772_ID	0x8772
>  #define IT8783_ID	0x8783
>  #define IT8786_ID	0x8786
>  
> @@ -294,6 +295,7 @@ static int __init it87_wdt_init(void)
>  	case IT8720_ID:
>  	case IT8721_ID:
>  	case IT8728_ID:
> +	case IT8772_ID:
>  	case IT8783_ID:
>  	case IT8786_ID:
>  		max_units = 65535;
