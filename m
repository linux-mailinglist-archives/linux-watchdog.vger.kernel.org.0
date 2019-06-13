Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0299043D29
	for <lists+linux-watchdog@lfdr.de>; Thu, 13 Jun 2019 17:40:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727143AbfFMPkA (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 13 Jun 2019 11:40:00 -0400
Received: from casper.infradead.org ([85.118.1.10]:33140 "EHLO
        casper.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731908AbfFMJyH (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 13 Jun 2019 05:54:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
        MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=0DKB9zhJLJWz7Ucy0xQYpQuP0DMygUsU5rmkGh0Xz9E=; b=ehpVYDyXjcKXf+A96uUPmbjpJw
        nAODNWeyWF4cwmRynkTd63OL7t7JI5IAb9pmMl5PPxjq2usrYufnmCuay8ibdyx2CTK9xoqZcpwGX
        ptBhbzPyIMmjdKwyrYqrZlFqfl4VEZabWhbkq8WcLeTegGHV/+J/KAHOq9A1V4KN6Rj15FVXiS9eZ
        4rzhFvA0E3mC/Mh9lfKGAVH0PDhDNvw22bYK5NXSJVPH/b5qQtkbrj6gSHg71IYR4v0ivmcY6Udc1
        pfb2pUAga32uwLVccsS61CjTTTf6z8GEtPr5L1wIt0fnzLwKk17+Xg8mQJHGZEgP2zVL3d3AvTUaL
        elPt7f0w==;
Received: from 201.86.169.251.dynamic.adsl.gvt.net.br ([201.86.169.251] helo=coco.lan)
        by casper.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1hbMQg-0000Y8-Ew; Thu, 13 Jun 2019 09:53:59 +0000
Date:   Thu, 13 Jun 2019 06:53:55 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     Jerry Hoemann <jerry.hoemann@hpe.com>
Cc:     linux@roeck-us.net, wim@linux-watchdog.org,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] docs: watchdog: Fix build error.
Message-ID: <20190613065355.117df659@coco.lan>
In-Reply-To: <20190613000237.377-2-jerry.hoemann@hpe.com>
References: <20190613000237.377-1-jerry.hoemann@hpe.com>
        <20190613000237.377-2-jerry.hoemann@hpe.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Em Wed, 12 Jun 2019 18:02:37 -0600
Jerry Hoemann <jerry.hoemann@hpe.com> escreveu:

> make htmldocs fails due to missing blank line following header.
> 
> Signed-off-by: Jerry Hoemann <jerry.hoemann@hpe.com>
Reviewed-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>

> ---
>  Documentation/watchdog/watchdog-parameters.rst | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/watchdog/watchdog-parameters.rst b/Documentation/watchdog/watchdog-parameters.rst
> index 01023382ea73..a3985cc5aeda 100644
> --- a/Documentation/watchdog/watchdog-parameters.rst
> +++ b/Documentation/watchdog/watchdog-parameters.rst
> @@ -12,6 +12,7 @@ providing kernel parameters for builtin drivers versus loadable
>  modules.
>  
>  -------------------------------------------------
> +
>  watchdog core:
>      open_timeout:
>  	Maximum time, in seconds, for which the watchdog framework will take
> @@ -22,6 +23,7 @@ watchdog core:
>  	fallback logic in the bootloader to try something else.
>  
>  -------------------------------------------------
> +
>  acquirewdt:
>      wdt_stop:
>  	Acquire WDT 'stop' io port (default 0x43)



Thanks,
Mauro
