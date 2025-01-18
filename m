Return-Path: <linux-watchdog+bounces-2737-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CE72A15DCC
	for <lists+linux-watchdog@lfdr.de>; Sat, 18 Jan 2025 16:52:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C808A3A8769
	for <lists+linux-watchdog@lfdr.de>; Sat, 18 Jan 2025 15:51:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6123119CD17;
	Sat, 18 Jan 2025 15:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MmjErNBb"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26B3419C560;
	Sat, 18 Jan 2025 15:51:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737215509; cv=none; b=E1EiPxMJpU36OgfG0sSRvnDSrOVk2RGa4L9rY4Y4es1AYCKUumkWFR+2aTumhClSHLuji+wHYPVrTmS04Pgtu0JfhIew6VOItvcUpAaG2zjy4G5cM3I8IAzKQygIuqfQwyjpRZWCjpP21bMD7r3xAUALh95hLnwaciBRLKo1Pi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737215509; c=relaxed/simple;
	bh=jXsuF2H5crZlmWog/efpYD6E3o/lAIeMrhBphGh2G90=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GYRpoeyHiA19UV26/Xnyk3RxQlv9u/jV+FaVtL7B0TBlXihXZX56AmvO2L7kQrn0E6cgifY5GgTf0C4pRxkAj9SzpPz0SklxK5q35NPmN4AY1uHxP+kbZ+P9opOgRu1qhPCSAPlOqzV5zqMXNJmAdYw6GRc2bviJGWVHNcE46m8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MmjErNBb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33077C4CED1;
	Sat, 18 Jan 2025 15:51:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737215508;
	bh=jXsuF2H5crZlmWog/efpYD6E3o/lAIeMrhBphGh2G90=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MmjErNBb871gdJRMXBY1Ja2MrqZ/YKO9m60yCiXfIJvSei7H4OcHYRKudf46dAfmv
	 eOsTxs1YEXWNyJrjjfBzend6l6ZGy4G5ajrOcZus2S9XNQmAhjh8DoDkAa8qhREE4X
	 sD/02Y8R9mdCEeTAKoYUElwpN3Bn688Fds2PTST9WN/OPHUGTuLa7DXvdHmh9tV0Tx
	 6F2bzPWUPhcFBr9Hux4n/EKPlingdO598jQGGvNrQQmoWGiXOORDThnxviEZJfX+mR
	 bv0t3SPcKJf56GJNMtZMe4svyWkV7LYJSBGgv27lktKfJso4H7nWTuRRItJvZ6rctE
	 TMBIWQTb2yKwA==
Date: Sat, 18 Jan 2025 16:51:45 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, 
	Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Biju Das <biju.das.au@gmail.com>
Subject: Re: [PATCH 1/5] dt-bindings: watchdog: renesas,wdt: Document RZ/G3E
 support
Message-ID: <20250118-satisfied-magnificent-polecat-ef1f0b@krzk-bin>
References: <20250115103858.104709-1-biju.das.jz@bp.renesas.com>
 <20250115103858.104709-2-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250115103858.104709-2-biju.das.jz@bp.renesas.com>

On Wed, Jan 15, 2025 at 10:38:50AM +0000, Biju Das wrote:
> Document the support for the watchdog IP available on RZ/G3E SoC. The
> watchdog IP available on RZ/G3E SoC is identical to the one found on
> RZ/V2H SoC.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
>  Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml | 4 ++++
>  1 file changed, 4 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


