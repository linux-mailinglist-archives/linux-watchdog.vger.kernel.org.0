Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2F9A29F9DA
	for <lists+linux-watchdog@lfdr.de>; Fri, 30 Oct 2020 01:40:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725811AbgJ3AkZ (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 29 Oct 2020 20:40:25 -0400
Received: from mail.kernel.org ([198.145.29.99]:35852 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725372AbgJ3AkY (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 29 Oct 2020 20:40:24 -0400
Received: from dragon (80.251.214.228.16clouds.com [80.251.214.228])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8B2DA206CB;
        Fri, 30 Oct 2020 00:40:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604018424;
        bh=BeJoLlxlE4Q2QqDM2+waIn2TFdSYqmTJYwjPZdPne9s=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=hU2ZGPh2fqXSWA3m8DQIGTgHfRUzHj1RMxqaM8NejSAaDe/yJ69l7SpW8NnRu7x6I
         lbak6bRk7S2604i23DAMDi7jgu/UkxKnlYXBODG4JY5Ke2iD3BqCr+AV1stjHlS/J0
         onkED1luDxb4KdLOFgpM70luuXRtHnxsWwEAww2Y=
Date:   Fri, 30 Oct 2020 08:40:16 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Li Yang <leoyang.li@nxp.com>,
        Anson Huang <Anson.Huang@nxp.com>,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] ARM: dts: freescale: align watchdog node name
 with dtschema
Message-ID: <20201030004015.GA28755@dragon>
References: <20201029162133.81016-1-krzk@kernel.org>
 <20201029162133.81016-2-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201029162133.81016-2-krzk@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Thu, Oct 29, 2020 at 05:21:33PM +0100, Krzysztof Kozlowski wrote:
> The dtschema expects watchdog device node name to be "watchdog":
> 
>   arch/arm64/boot/dts/freescale/fsl-ls1012a-frdm.dt.yaml: wdog@2ad0000:
>     $nodename:0: 'wdog@2ad0000' does not match '^watchdog(@.*|-[0-9a-f])?$'
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

s/ARM/arm64 in subject.

I fixed it up and applied the patch.

Shawn

> 
> ---
> 
> Changes since v1:
> 1. New patch
> ---
>  arch/arm64/boot/dts/freescale/fsl-ls1012a.dtsi | 2 +-
>  arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
