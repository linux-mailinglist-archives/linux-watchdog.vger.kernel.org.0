Return-Path: <linux-watchdog+bounces-4264-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 93ABAB86C35
	for <lists+linux-watchdog@lfdr.de>; Thu, 18 Sep 2025 21:49:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9F3D67ABD20
	for <lists+linux-watchdog@lfdr.de>; Thu, 18 Sep 2025 19:48:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E7A12D6E78;
	Thu, 18 Sep 2025 19:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P94PLKB4"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50D77224B09;
	Thu, 18 Sep 2025 19:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758224989; cv=none; b=gTyC7LWzXQKSzvEgq+YcAo2PCrz7z/fg8H+F35HHSFIvy/cZ9tEoDxz/iWQQT63tr4Fti3hJCFliCZvpLLZhaX8C8AbAATCf4NpU25gEEhaCK6swzJ3AdsCKijk+vPxZ5akm01ZJ0niD/GzSDTZGVWXPW0ohey/+m5QfunxpRKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758224989; c=relaxed/simple;
	bh=pTzhg4AMOBXhp28Fap5kFnlFiKyPmVT4i1ixXerCjic=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HUGoab6h4k8pKg5d1h4hZETeGqk0ZAMYQuYfbLj1FSgfYASuGuFl6kGaTqJTnWVVLhl9w6fjGioxc3kg5zKLyz+o7fyWfI0NKyONL3B9B6ZWwQcvquzQ8LnWWkaCAaErfwqEo/S2DCWDMvvA1+iOUvhjJcchG5ddcpOFDrbKMuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P94PLKB4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0F92C4CEE7;
	Thu, 18 Sep 2025 19:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758224988;
	bh=pTzhg4AMOBXhp28Fap5kFnlFiKyPmVT4i1ixXerCjic=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=P94PLKB4GAgJBrPitzz7l7wZSYFmx7BNeewVu9FvXXi+jEJugm7yvXvEvFah52jui
	 ZBsfRdQV7l5kMc5GkFjdc+gCUrLptZJCL+KqveYUTnavUAMGB4uFZ7sfZ/XC51jakA
	 +6dLkwN8WR2feaemsK5poa5d+KSqbfCDj2nCqPkRUN8Em1zNAd4pE4rm643EsbQjgU
	 XA11+v6tENyVOk0Vh67kPa2uLeUQt0taZW9sxYK/xPOMX7Xer7dJpn+JzklKTpjYbG
	 db+vKiD1uBN5wmRHM1XSzSsTZfVoeVHjxf5LRsjCC0kpTv24PmkHZQlhdN8o7ODK5N
	 BDTLIW1/Dm4Qg==
Date: Thu, 18 Sep 2025 14:49:47 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, devicetree@vger.kernel.org,
	Avi Fishman <avifishman70@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>, Joel Stanley <joel@jms.id.au>,
	linux-watchdog@vger.kernel.org,
	Patrick Venture <venture@google.com>, openbmc@lists.ozlabs.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Nancy Yuen <yuenn@google.com>, Conor Dooley <conor+dt@kernel.org>,
	Tomer Maimon <tmaimon77@gmail.com>, linux-kernel@vger.kernel.org,
	Guenter Roeck <linux@roeck-us.net>,
	Benjamin Fair <benjaminfair@google.com>
Subject: Re: [PATCH] dt-bindings: watchdog: Convert nuvoton,npcm-wdt to DT
 schema
Message-ID: <175822498593.2514920.10353699650446603831.robh@kernel.org>
References: <20250909142201.3209482-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250909142201.3209482-1-robh@kernel.org>


On Tue, 09 Sep 2025 09:21:59 -0500, Rob Herring (Arm) wrote:
> Convert the Nuvoton watchdog binding to DT schema format. It's a
> straight-forward conversion.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  .../bindings/watchdog/nuvoton,npcm-wdt.txt    | 30 ----------
>  .../watchdog/nuvoton,npcm750-wdt.yaml         | 60 +++++++++++++++++++
>  2 files changed, 60 insertions(+), 30 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/watchdog/nuvoton,npcm-wdt.txt
>  create mode 100644 Documentation/devicetree/bindings/watchdog/nuvoton,npcm750-wdt.yaml
> 

Applied, thanks!


