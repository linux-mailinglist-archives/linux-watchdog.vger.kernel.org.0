Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4126D7D517
	for <lists+linux-watchdog@lfdr.de>; Thu,  1 Aug 2019 07:58:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728316AbfHAF6N (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 1 Aug 2019 01:58:13 -0400
Received: from mail.kernel.org ([198.145.29.99]:50776 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727540AbfHAF6N (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 1 Aug 2019 01:58:13 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9C931206A2;
        Thu,  1 Aug 2019 05:58:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1564639092;
        bh=18M1+P9KesdsimSQfSqq898kk6BSKJDA151IrpFkfuU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=IhuIctS7MqfUiQKncJHIjrxZSF+/Dx0klY386/15CcNttSPWK/WXc16jf9+HVeMTG
         DUuwqZp4ieY7O1fs2S6Qg8S2JJ8fIE0vcE0xmzV3JU6znCfn1ZqVWviIJeyISiAgVn
         JXI5g2aEP0Vx7p3kRieznWXbKV8+Dekxfd4y1660=
Date:   Thu, 1 Aug 2019 07:58:09 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     soc@kernel.org, linux-arm-kernel@lists.infradead.org,
        Vladimir Zapolskiy <vz@mleia.com>,
        Sylvain Lemieux <slemieux.tyco@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Jason Cooper <jason@lakedaemon.net>,
        Andrew Lunn <andrew@lunn.ch>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        "David S. Miller" <davem@davemloft.net>,
        Guenter Roeck <linux@roeck-us.net>, linux-gpio@vger.kernel.org,
        netdev@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-watchdog@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 01/14] usb: ohci-nxp: enable compile-testing
Message-ID: <20190801055809.GA24607@kroah.com>
References: <20190731195713.3150463-1-arnd@arndb.de>
 <20190731195713.3150463-2-arnd@arndb.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190731195713.3150463-2-arnd@arndb.de>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Wed, Jul 31, 2019 at 09:56:43PM +0200, Arnd Bergmann wrote:
> The driver hardcodes a hardware I/O address the way one should
> generally not do, and this prevents both compile-testing, and
> moving the platform to CONFIG_ARCH_MULTIPLATFORM.
> 
> Change the code to be independent of the machine headers
> to allow those two. Removing the hardcoded address would
> be hard and is not necessary, so leave that in place for now.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/usb/host/Kconfig    |  3 ++-
>  drivers/usb/host/ohci-nxp.c | 25 ++++++++++++++++++-------
>  2 files changed, 20 insertions(+), 8 deletions(-)

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
