Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A7C8F150EE8
	for <lists+linux-watchdog@lfdr.de>; Mon,  3 Feb 2020 18:49:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727775AbgBCRtl (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 3 Feb 2020 12:49:41 -0500
Received: from mail-pj1-f66.google.com ([209.85.216.66]:54324 "EHLO
        mail-pj1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727314AbgBCRtl (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 3 Feb 2020 12:49:41 -0500
Received: by mail-pj1-f66.google.com with SMTP id dw13so73888pjb.4;
        Mon, 03 Feb 2020 09:49:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=VFIHct8h7RIoSFqhED+o/Azmguq6Ly7hEHelGB4W9mA=;
        b=rJLh2L/JEaA6qndkElyMttwtnyOOcFo960BcBRtEhli7f+n5Htup9fOrk7dDrf71b9
         bwKcPMeuY0GzMnuUsXSrcI1exWFWvfuLcD6cbbJyrrkS5Fs91/MHqci/eA1F9l5GDlav
         C+JhNAubnuJ1c84qw7UqStwYFixG+SBAbDrdXPoTIfH59gPPfbgjjQ/RqD3Dx3fD/zQk
         EIP8SiwqlEIFSTodreMH1vbNTpjlpO8jc/hT1/DGjqZWOlqn/zmZnISvcuNzJRt3beFC
         GVt/ON72eBuasAWL/wUc/RuThDZUfxMgXJ2SsRUNVqhb0evzm3IKAbFEAzLA+6naeFrJ
         alkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=VFIHct8h7RIoSFqhED+o/Azmguq6Ly7hEHelGB4W9mA=;
        b=gYW7iAt9VvhXhk62shGrLWh/+SKhAwRwyN+Z+hQHR4TeSFDrkS+Z1PKWX0c2w/uP2R
         4DcCjDAvsHqgFXtJ9dekPx3f0D8EVGjvzmwtzUzkeaRV7ikwcbMGzNazvN0yebhslE0M
         tATuKydAh1QJakmfgroAsQNMFRRO56mwJtW5Ve70iqUQw405eF1r10yLRylvB5GqeD4x
         /nf5aN7K7SIQ/XODST1YeJG2S88IZ3e5TgQHcxUGOrDrpvbnaWmwy8zqcEdU74mnmFSN
         LpIU9XZkKAx9LspuvkmsThBbVbRr19G6Bx5we5A5JeMavUlTqm17vjUkCiiripZ/de5d
         7IdA==
X-Gm-Message-State: APjAAAVpL1+ex89bA6Hm6xZvKbzlKB8ckQKO+mgtDgkqwDfKutuHY+eI
        EMaRxTkNEPHDctw6Etskxww=
X-Google-Smtp-Source: APXvYqwjIumHE4pR9pnVMujFPGFWpCGP5BbojLG8Sb/TuKcHjQDsDGAkmB4Q9MYtN8sRZVHvt9LVgA==
X-Received: by 2002:a17:902:a984:: with SMTP id bh4mr25180238plb.281.1580752179633;
        Mon, 03 Feb 2020 09:49:39 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id j8sm97701pjb.4.2020.02.03.09.49.38
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 03 Feb 2020 09:49:38 -0800 (PST)
Date:   Mon, 3 Feb 2020 09:49:37 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        "wim@linux-watchdog.org" <wim@linux-watchdog.org>,
        Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH -next] watchdog: fix mtk_wdt.c RESET_CONTROLLER build
 error
Message-ID: <20200203174937.GA18628@roeck-us.net>
References: <77c1e557-4941-3806-2933-6c3583576390@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <77c1e557-4941-3806-2933-6c3583576390@infradead.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Mon, Feb 03, 2020 at 08:10:29AM -0800, Randy Dunlap wrote:
> From: Randy Dunlap <rdunlap@infradead.org>
> 
> Fix build error when CONFIG_RESET_CONTROLLER is not set by
> selecting RESET_CONTROLLER.
> 
> ld: drivers/watchdog/mtk_wdt.o: in function `mtk_wdt_probe':
> mtk_wdt.c:(.text+0x3ec): undefined reference to `devm_reset_controller_register'
> 
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Wim Van Sebroeck <wim@linux-watchdog.org>
> Cc: Guenter Roeck <linux@roeck-us.net>
> Cc: Matthias Brugger <matthias.bgg@gmail.com>
> Cc: linux-watchdog@vger.kernel.org

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/Kconfig |    1 +
>  1 file changed, 1 insertion(+)
> 
> --- linux-next-20200203.orig/drivers/watchdog/Kconfig
> +++ linux-next-20200203/drivers/watchdog/Kconfig
> @@ -841,6 +841,7 @@ config MEDIATEK_WATCHDOG
>  	tristate "Mediatek SoCs watchdog support"
>  	depends on ARCH_MEDIATEK || COMPILE_TEST
>  	select WATCHDOG_CORE
> +	select RESET_CONTROLLER
>  	help
>  	  Say Y here to include support for the watchdog timer
>  	  in Mediatek SoCs.
> 
> 
