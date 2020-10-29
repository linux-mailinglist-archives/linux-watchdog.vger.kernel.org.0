Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 254CD29EE78
	for <lists+linux-watchdog@lfdr.de>; Thu, 29 Oct 2020 15:38:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727811AbgJ2Oik (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 29 Oct 2020 10:38:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:54850 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726633AbgJ2Oij (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 29 Oct 2020 10:38:39 -0400
Received: from dragon (80.251.214.228.16clouds.com [80.251.214.228])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id AB00320838;
        Thu, 29 Oct 2020 14:38:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603982318;
        bh=lpap4OX+zPcl6AnnPrkz0b6bIwI848Tf2T/ghPY/wYI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=QD6aDugJOtBCmlRhoTG8cGgwRc+I7T5fUGbpy2KWlnzHqpQKeDpOMFc+cG0QZVenX
         PhcR55mKHO0TQ+Lb2yMVbIKG4cX7NufLpel8B99rKQSymGPyGXVQy4AWV0dTMCdcvK
         aUZ+qRIOyxj86B6FlBLnXKn7dP2CldTC7Ue7zds4=
Date:   Thu, 29 Oct 2020 22:38:31 +0800
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
Subject: Re: [PATCH 2/3] ARM: dts: imx: align watchdog node name with dtschema
Message-ID: <20201029143831.GP28755@dragon>
References: <20200926162302.32525-1-krzk@kernel.org>
 <20200926162302.32525-2-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200926162302.32525-2-krzk@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Sat, Sep 26, 2020 at 06:23:01PM +0200, Krzysztof Kozlowski wrote:
> The dtschema expects watchdog device node name to be "watchdog":
> 
>   arch/arm/boot/dts/imx31-bug.dt.yaml: wdog@53fdc000:
>     $nodename:0: 'wdog@53fdc000' does not match '^watchdog(@.*|-[0-9a-f])?$'
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Applied, thanks.
