Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5FE1627160E
	for <lists+linux-watchdog@lfdr.de>; Sun, 20 Sep 2020 18:51:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726326AbgITQvO convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-watchdog@lfdr.de>);
        Sun, 20 Sep 2020 12:51:14 -0400
Received: from pegase1.c-s.fr ([93.17.236.30]:28606 "EHLO pegase1.c-s.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726267AbgITQvO (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Sun, 20 Sep 2020 12:51:14 -0400
X-Greylist: delayed 1929 seconds by postgrey-1.27 at vger.kernel.org; Sun, 20 Sep 2020 12:51:13 EDT
Received: from localhost (mailhub1-int [192.168.12.234])
        by localhost (Postfix) with ESMTP id 4BvXnZ292gz9twrG;
        Sun, 20 Sep 2020 18:18:58 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
        by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
        with ESMTP id Y2LHIYqBMmfM; Sun, 20 Sep 2020 18:18:58 +0200 (CEST)
Received: from vm-hermes.si.c-s.fr (vm-hermes.si.c-s.fr [192.168.25.253])
        by pegase1.c-s.fr (Postfix) with ESMTP id 4BvXnZ182Yz9twrF;
        Sun, 20 Sep 2020 18:18:58 +0200 (CEST)
Received: by vm-hermes.si.c-s.fr (Postfix, from userid 33)
        id 2CDF9650; Sun, 20 Sep 2020 18:21:03 +0200 (CEST)
Received: from rop17-1_migr-88-124-70-171.fbx.proxad.net
 (rop17-1_migr-88-124-70-171.fbx.proxad.net [88.124.70.171]) by
 messagerie.si.c-s.fr (Horde Framework) with HTTP; Sun, 20 Sep 2020 18:21:03
 +0200
Date:   Sun, 20 Sep 2020 18:21:03 +0200
Message-ID: <20200920182103.Horde.CrXBasE1t05E1AKBoy6wCQ1@messagerie.si.c-s.fr>
From:   Christophe Leroy <christophe.leroy@csgroup.eu>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org,
        linux@roeck-us.net, wim@linux-watchdog.org
Subject: Re: [PATCH] watchdog: fix memory leak in error path
In-Reply-To: <20200920083745.GA1186@amd>
User-Agent: Internet Messaging Program (IMP) H5 (6.2.3)
Content-Type: text/plain; charset=UTF-8; format=flowed; DelSp=Yes
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Pavel Machek <pavel@ucw.cz> a écrit :

> Fix memory leak in error path.
>
> Signed-off-by: Pavel Machek (CIP) <pavel@denx.de>
>
> diff --git a/drivers/watchdog/watchdog_dev.c  
> b/drivers/watchdog/watchdog_dev.c
> index 6798addabd5a..785270ee337c 100644
> --- a/drivers/watchdog/watchdog_dev.c
> +++ b/drivers/watchdog/watchdog_dev.c
> @@ -994,8 +994,10 @@ static int watchdog_cdev_register(struct  
> watchdog_device *wdd)
>  	wd_data->wdd = wdd;
>  	wdd->wd_data = wd_data;
>
> -	if (IS_ERR_OR_NULL(watchdog_kworker))

Maybe it would be better to move this check before the kzalloc as the  
wd_data is not needed for doing that check.

Christophe

> +	if (IS_ERR_OR_NULL(watchdog_kworker)) {
> +		kfree(wd_data);
>  		return -ENODEV;
> +	}
>
>  	device_initialize(&wd_data->dev);
>  	wd_data->dev.devt = MKDEV(MAJOR(watchdog_devt), wdd->id);
>
> --
> (english) http://www.livejournal.com/~pavelmachek
> (cesky, pictures)  
> http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html


