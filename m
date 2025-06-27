Return-Path: <linux-watchdog+bounces-3757-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B70EAEC1EA
	for <lists+linux-watchdog@lfdr.de>; Fri, 27 Jun 2025 23:22:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BECA4642229
	for <lists+linux-watchdog@lfdr.de>; Fri, 27 Jun 2025 21:22:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D486227146B;
	Fri, 27 Jun 2025 21:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JcBllNNA"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A263626FDA8;
	Fri, 27 Jun 2025 21:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751059364; cv=none; b=g+ija2FZAtqcsee6BXtQ1YYqrU6/PROVNvDSlG51e8N9wyLHy0lD15F70yzmtQNIKByg1E+2oCulEe9WMa1RtBtlNVgLKn35IGwokdrtDHuPLUbawvzNh5hfueYepdtOASkVqQX4Yn2C4ZZm7YRba3nyelws/Dv/Vx2WXoV1nFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751059364; c=relaxed/simple;
	bh=f/Hjt44z5eQtUir5T1oW77jFYNUvVS0e+aUkWqb1azU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ntLE98HINbiFqzR4r2eOgxr46oPh7tmri3z2x04GBS14Dzre07SmrxRPQ+S5ZfZnce0z0lCcsKqqpkYHPvaqrr3uGvxXLM93cSafF+Os9/Umd3cNAzghtz+Q7vH3+sdj6vbh9yw9W72ACmQXITEYpIJhgkf5F0mA1oinxPRRHuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JcBllNNA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24855C4CEE3;
	Fri, 27 Jun 2025 21:22:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751059364;
	bh=f/Hjt44z5eQtUir5T1oW77jFYNUvVS0e+aUkWqb1azU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JcBllNNALh/S23+GMaSDwmJr3LC2G/WQrNYvN2TZ9DuEQ3WU3uGjD1MP5+GwVvhP9
	 Qi0IK9xq81jM1WJoA+xKJQGG2gPJZzz7gfanv99rv7smAQzg3os9J3y/Ccaf7w+eKq
	 vnKJWTf/nxT9R5g6va1mhj+8WdoqItsn2lUTIPjmiOTZkai2H7/bCFu9cEx2ah2QQh
	 NEj0p+B3E/i41U4JQ6ihAAuDQ7w9S3kXo0vApRZxq8s/8+4+PBPtf6LCN+sD1XjgQA
	 DSMx0jCwiPzWFM6ZukJbNYR8xygxZwSZixb8+VbqGbLfhRzrd9MqYOUnBwTZc+knc7
	 eb0Vii0FyvAmg==
Date: Fri, 27 Jun 2025 16:22:43 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Max Shevchenko <wctrl@proton.me>
Cc: Russell King <linux@armlinux.org.uk>, linux-serial@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>, linux-watchdog@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Jiri Slaby <jirislaby@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	Thomas Gleixner <tglx@linutronix.de>,
	Sean Wang <sean.wang@mediatek.com>,
	linux-arm-kernel@lists.infradead.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v2 02/11] dt-bindings: interrupt-controller:
 mediatek,mt6577-sysirq: add MT6572
Message-ID: <175105936297.165672.12493055283897899399.robh@kernel.org>
References: <20250626-mt6572-v2-0-f7f842196986@proton.me>
 <20250626-mt6572-v2-2-f7f842196986@proton.me>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250626-mt6572-v2-2-f7f842196986@proton.me>


On Thu, 26 Jun 2025 11:53:55 +0300, Max Shevchenko wrote:
> Add a compatible string for sysirq on the MT6572 SoC.
> 
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: Max Shevchenko <wctrl@proton.me>
> ---
>  .../devicetree/bindings/interrupt-controller/mediatek,mt6577-sysirq.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


