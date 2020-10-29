Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 50D1229EE7D
	for <lists+linux-watchdog@lfdr.de>; Thu, 29 Oct 2020 15:39:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726633AbgJ2Ojf (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 29 Oct 2020 10:39:35 -0400
Received: from mail.kernel.org ([198.145.29.99]:55338 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725940AbgJ2Oje (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 29 Oct 2020 10:39:34 -0400
Received: from dragon (80.251.214.228.16clouds.com [80.251.214.228])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 140A820838;
        Thu, 29 Oct 2020 14:39:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603982374;
        bh=UxKTrOdbQX8WwcdQeFEJqz4r+f0/JB4wMaev8w7Ad88=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=T6uJfLd6Zfm8m7sZgdS926PUyJig4Y8AaIu6IdtP9KCp8CsXlcsz4f4atTFg0cr6a
         Qo9FMu7gk+f/lP5vFTa0ihGsyoSy12eoxMHxoNeyTtIqU6qEyBqn1M+4YT1EgejAlA
         tqNmrhmFhMfRup/LhiWNEjZvitZezcEIaNojK/io=
Date:   Thu, 29 Oct 2020 22:39:26 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Stefan Agner <stefan@agner.ch>,
        Anson Huang <Anson.Huang@nxp.com>,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] ARM: dts: vf: align watchdog node name with dtschema
Message-ID: <20201029143925.GQ28755@dragon>
References: <20200926162302.32525-1-krzk@kernel.org>
 <20200926162302.32525-3-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200926162302.32525-3-krzk@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Sat, Sep 26, 2020 at 06:23:02PM +0200, Krzysztof Kozlowski wrote:
> The dtschema expects watchdog device node name to be "watchdog":
> 
>   arch/arm/boot/dts/vf500-colibri-eval-v3.dt.yaml: wdog@4003e000:
>     $nodename:0: 'wdog@4003e000' does not match '^watchdog(@.*|-[0-9a-f])?$'
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Applied, thanks.
