Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB6DB343019
	for <lists+linux-watchdog@lfdr.de>; Sat, 20 Mar 2021 23:41:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229865AbhCTWlV (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 20 Mar 2021 18:41:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230034AbhCTWlA (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 20 Mar 2021 18:41:00 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09080C061574;
        Sat, 20 Mar 2021 15:41:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Sender:Content-Type:MIME-Version:
        References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=gdLYIO3yw9/hwydqN88ER3QaHJ97wg2y5d7EIg5XUns=; b=ufUoR30CB9JWB45VXzcCf+s16R
        Hqi6VdMuRv0UDGzOPYZRqrkOobKgFmBtrknoHV7ve3h6ObpvNaS5CKMp/8GWRryzYav+Aht5QYs7U
        7+3iqw1YLyYVgslnXUZKycYjJTF7yYNWRDGgGDEme9Hqs79fy9HrM5q5U7yAyjK6fsw9iq6X39UAd
        XMk4JaAXU45vXnZSNL2ppLP/1JTlTC+iVxIvz+EuNPYF68/KDc4EQn6rBd8jGsmRkOQ1iul5yBVV7
        X9D4cqW+NHXTmU8xFE7IPrisXmBVuVU2+xVvDx8LrvFbL9MIRQJp6MV4eTm+KxF/tSFr0RdPCcpDA
        tGaY64SQ==;
Received: from rdunlap (helo=localhost)
        by bombadil.infradead.org with local-esmtp (Exim 4.94 #2 (Red Hat Linux))
        id 1lNkHA-0024hb-Bg; Sat, 20 Mar 2021 22:40:57 +0000
Date:   Sat, 20 Mar 2021 15:40:56 -0700 (PDT)
From:   Randy Dunlap <rdunlap@bombadil.infradead.org>
To:     Bhaskar Chowdhury <unixbhaskar@gmail.com>
cc:     wim@linux-watchdog.org, linux@roeck-us.net,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] watchdog: Fix a typo
In-Reply-To: <20210320213301.8513-1-unixbhaskar@gmail.com>
Message-ID: <bc91920-e757-41d5-6fe6-73a511aa71b@bombadil.infradead.org>
References: <20210320213301.8513-1-unixbhaskar@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
Sender: Randy Dunlap <rdunlap@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210320_154056_421489_7BF46DE4 
X-CRM114-Status: GOOD (  13.52  )
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam detection software, running on the system "bombadil.infradead.org",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Sun, 21 Mar 2021, Bhaskar Chowdhury wrote: > s/parmeter/parameter/
    > > Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com> Acked-by: Randy
    Dunlap <rdunlap@infradead.org> 
 Content analysis details:   (-0.0 points, 5.0 required)
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 NO_RELAYS              Informational: message was not relayed via SMTP
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org



On Sun, 21 Mar 2021, Bhaskar Chowdhury wrote:

> s/parmeter/parameter/
>
> Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>

Acked-by: Randy Dunlap <rdunlap@infradead.org>


> ---
> drivers/watchdog/sl28cpld_wdt.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/watchdog/sl28cpld_wdt.c b/drivers/watchdog/sl28cpld_wdt.c
> index a45047d8d9ab..2de93298475f 100644
> --- a/drivers/watchdog/sl28cpld_wdt.c
> +++ b/drivers/watchdog/sl28cpld_wdt.c
> @@ -164,7 +164,7 @@ static int sl28cpld_wdt_probe(struct platform_device *pdev)
>
> 	/*
> 	 * Initial timeout value, may be overwritten by device tree or module
> -	 * parmeter in watchdog_init_timeout().
> +	 * parameter in watchdog_init_timeout().
> 	 *
> 	 * Reading a zero here means that either the hardware has a default
> 	 * value of zero (which is very unlikely and definitely a hardware
> --
> 2.26.2
>
>
