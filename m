Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AFA7022521F
	for <lists+linux-watchdog@lfdr.de>; Sun, 19 Jul 2020 16:02:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726021AbgGSOCA (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sun, 19 Jul 2020 10:02:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725988AbgGSOB7 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sun, 19 Jul 2020 10:01:59 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB452C0619D2;
        Sun, 19 Jul 2020 07:01:59 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id q17so7474156pls.9;
        Sun, 19 Jul 2020 07:01:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Rv9i5ahW69IEp+AW3DUIhCv4FyNoa8w7LHOfx/9zJxU=;
        b=LYPxtBd3qJoC6tdkkeBgVXRR0MazvfOrwthfLhmeVv71eYROEcVxeqePT3Y/MNxODS
         d33bSSUrQjCGCNs7x5vKrXVr2DEAJ8BzNpdEdYjPu52WfqiMR2l6Vq2TilnSiAB+5o0W
         bTnA7SD3Eu8Gb6AmmtcYyUsb1TfoZrOG1cogzKvO1p+NorlgLYuc1agYjDhKUAkMvEgr
         GHE5u+YCTdfcb92t0Fu6sUJhjcfdXj74msG+LzBaXjmI/RsUjoHozyZwmCS/lqN9gX+e
         GPgyH9OBbT5TJ57i0zecurPyUMNqy5sdwZiveGaHUzWGPatxLFJNXXrDRACNTRlw6jbq
         MlUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=Rv9i5ahW69IEp+AW3DUIhCv4FyNoa8w7LHOfx/9zJxU=;
        b=FgAW0NDzumJ0HRs9s7SeG9rueHQ86isnn58nxf+SpdYnLPaAPz7Bfwwhdb/kQAvdiP
         dp8KPCkkL7oMnGR5YvAXLxHODaf7CbOGmn6tfM4ohhUCECMYqo4goawYwomR07GAQydH
         ynwzis9RHJGu7M9o3J/524NN2ZkBE05Raml12aojB5BY8O00DdOVq+DPHes7UHP5rwpQ
         soTXHgmrsnvbwyTva73l+061Sdm/dXPT6XGABizOVMjsLhVDdupkVied0DG/Zfwa/EiX
         cMaZC2rAZijEKSTPbxvlov07GcSKqI9Pew4p41VgMmFObt7JbyKDISshP9HxebcCdMga
         OROQ==
X-Gm-Message-State: AOAM533PfvtCzQL1IrbV/Lhasn7MJndpEswJR7Hfrwq9Uf2OHnJr8J2H
        wNaQziRgMIudJisA9x3l/04=
X-Google-Smtp-Source: ABdhPJwDuV/wp/oBfRYX2FG8lmogMmZW6aqTpG5zeAf2vm+WYRSunkaXpgGdzj25Q6ZMwquYNjAGFA==
X-Received: by 2002:a17:90a:f206:: with SMTP id bs6mr18967894pjb.48.1595167319453;
        Sun, 19 Jul 2020 07:01:59 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id o12sm13971349pfu.188.2020.07.19.07.01.58
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 19 Jul 2020 07:01:59 -0700 (PDT)
Date:   Sun, 19 Jul 2020 07:01:58 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Xu Wang <vulab@iscas.ac.cn>
Cc:     wim@linux-watchdog.org, linux-watchdog@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] watchdog: pcwd_usb: remove needless check before
 usb_free_coherent()
Message-ID: <20200719140158.GA37652@roeck-us.net>
References: <20200713055348.21620-1-vulab@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200713055348.21620-1-vulab@iscas.ac.cn>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Mon, Jul 13, 2020 at 05:53:48AM +0000, Xu Wang wrote:
> usb_free_coherent() is safe with NULL usb_pcwd->intr_buffer and 
> this check is not required.
> 
> Signed-off-by: Xu Wang <vulab@iscas.ac.cn>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/pcwd_usb.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/watchdog/pcwd_usb.c b/drivers/watchdog/pcwd_usb.c
> index 2f44af1831d0..6726301ac02e 100644
> --- a/drivers/watchdog/pcwd_usb.c
> +++ b/drivers/watchdog/pcwd_usb.c
> @@ -585,9 +585,8 @@ static struct notifier_block usb_pcwd_notifier = {
>  static inline void usb_pcwd_delete(struct usb_pcwd_private *usb_pcwd)
>  {
>  	usb_free_urb(usb_pcwd->intr_urb);
> -	if (usb_pcwd->intr_buffer != NULL)
> -		usb_free_coherent(usb_pcwd->udev, usb_pcwd->intr_size,
> -				  usb_pcwd->intr_buffer, usb_pcwd->intr_dma);
> +	usb_free_coherent(usb_pcwd->udev, usb_pcwd->intr_size,
> +			  usb_pcwd->intr_buffer, usb_pcwd->intr_dma);
>  	kfree(usb_pcwd);
>  }
>  
