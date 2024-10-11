Return-Path: <linux-watchdog+bounces-2189-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B0EB9999B0B
	for <lists+linux-watchdog@lfdr.de>; Fri, 11 Oct 2024 05:13:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2AA33B227DE
	for <lists+linux-watchdog@lfdr.de>; Fri, 11 Oct 2024 03:13:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C26D61F472C;
	Fri, 11 Oct 2024 03:13:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sqgg+DuA"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 851CAEBE;
	Fri, 11 Oct 2024 03:13:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728616405; cv=none; b=eOa1RtBFTgytyVv7HEn3cUSOfJ5NNcF7z2en4B8GpV2Y3VzzrKSiCqfbGolIt79LiZtRweTVACHK4cKm82dcxiYLCNDk4iK2i/8CEzLYLQbANx6aY7YtftBBns7wUAyuD0g8yYEC+GNvn18kE4/FzgzyDzASAF7iug12fmk/yeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728616405; c=relaxed/simple;
	bh=Akm9XTGaZ+hdSTC+onu5IFuEnj47oz+SCxXYGHPS0So=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c/LW9XFrr84W7b7fJiXvUkwCyXoDlJ7UO0ZR8Mu/A+N6NsF5XdAZ/79AVX++koamjYZR58FO3VGNNA7d6nZ247O5Etro/R6W5r2HO2RmyS+B9rsjZ2lkXFzJ2gwTqjpgDZdXJYKtApPRc+DokTwfB6f8dQXijQtX5jfLvzku2MI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sqgg+DuA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38ED8C4CEC3;
	Fri, 11 Oct 2024 03:13:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728616405;
	bh=Akm9XTGaZ+hdSTC+onu5IFuEnj47oz+SCxXYGHPS0So=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sqgg+DuAZaaPkGNhU6RDpjIgecIf/PrP80vCN5IJSZ2Ie7ilTsgDb63kr00lTl/+s
	 RFEJxvbqGGaQNrl60wkwcM8z1nj3aSkHLtrwDgXrtk/f9rMbHHpk9ViXz9UsaTe/Io
	 Bw6UvSAGR1qNqiENz5P1OezswrUWUkUY0BuXCB/wqZV36K7fV81Ol+G33f6ImXB5e4
	 s8IlSudfCxeBda01Zz98CQ+Qkj0fWO0NDo30XaVMwkDfKORgIfmAyBziSJ4Bxz0ODY
	 KOcmQwtUqTnnNI0MTtmcwfW/BC+hHLGtmpT7DaIWQtiClMRHpYtZUACTzZ2ka93dMh
	 koew/uGKVAg4A==
Date: Thu, 10 Oct 2024 22:13:24 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Jingoo Han <jingoohan1@gmail.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Daniel Thompson <daniel.thompson@linaro.org>,
	linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	linux-leds@vger.kernel.org, Pavel Machek <pavel@ucw.cz>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	dri-devel@lists.freedesktop.org, linux-input@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>
Subject: Re: [PATCH v2 2/5] dt-bindings: backlight: convert
 zii,rave-sp-backlight.txt to yaml
Message-ID: <172861640278.2238116.3542254173339737101.robh@kernel.org>
References: <20241010-zii_yaml-v2-0-0ab730607422@nxp.com>
 <20241010-zii_yaml-v2-2-0ab730607422@nxp.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241010-zii_yaml-v2-2-0ab730607422@nxp.com>


On Thu, 10 Oct 2024 11:42:39 -0400, Frank Li wrote:
> Convert device tree binding doc zii,rave-sp-backlight.txt to yaml format.
> Additional Changes:
> - Remove mfd parent node at example.
> - Ref to backlight's common.yaml
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  .../leds/backlight/zii,rave-sp-backlight.txt       | 23 --------------
>  .../leds/backlight/zii,rave-sp-backlight.yaml      | 36 ++++++++++++++++++++++
>  2 files changed, 36 insertions(+), 23 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


