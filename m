Return-Path: <linux-watchdog+bounces-3743-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A2BAAEB1E3
	for <lists+linux-watchdog@lfdr.de>; Fri, 27 Jun 2025 11:02:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CA02F178BC4
	for <lists+linux-watchdog@lfdr.de>; Fri, 27 Jun 2025 09:02:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8337128DB55;
	Fri, 27 Jun 2025 09:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KoEyDHcD"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57F0C28D83C;
	Fri, 27 Jun 2025 09:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751014933; cv=none; b=hozx2cwB1pDkowZVZKA9wYEoUPTN1Yq5xkRlgwtv7C/CjucSU+o4a2NC/1V9hwrtgp6XxeOp82c7CiCOO2iTvlpWfgp7UI2MLiKZUxeQaq+921ELBbgb4419uisopaEeoPE8iSmr7aj6GnmbKMkk8Ujko63Zf11ReBCFHdTq4Lc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751014933; c=relaxed/simple;
	bh=fIz5WUAdaNKsNTv8ZLpRhCg1RyDViLYhSyw/mC0I/Ug=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A/DPU5SZb9MNA8N2PFxTQsh78iwNJnd3ysYNMtDbzONVnBS7BKH3f0emuplADbcZM4JWHheAu0d9w7U5RgsfYYUEeS5g3Q0KsAmRvqQ6V4T+rN7vgT+7/OHsvSa8/a+mcXew0oU3+PlqKCI5/fDjhJKZWcll1lusaOlUpuW5Vnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KoEyDHcD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECEB6C4CEEB;
	Fri, 27 Jun 2025 09:02:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751014932;
	bh=fIz5WUAdaNKsNTv8ZLpRhCg1RyDViLYhSyw/mC0I/Ug=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KoEyDHcDgPY4W2n93G838YPTOJ4xzfn6GSQ4x5HJ61s6C9fcMoB1z+Y5FloF+5m2k
	 rc6xkOTIfypdC3K2XowFbpE95m6toMu7ppyxcfGTeftM4/n6Cn/Qr1u/VmKME13fYS
	 erLRkIU9Lzd9nKI+wQRc2gLqJ/WJOCY+jgXk3phCju2qnCOd5q7AqrcWc6WCprkDBC
	 njgRcgXGKnswAsl7zcuoMExRGHBFqGFmD1dSZauunEfPf2Thmx1SReOGHSvYbofA/T
	 0aKgvSSuH0K5mLsMQCkRcfioK4YqZxCtG0ip0R/2+iUOGLdHptK5LMTbozsGOSKKqV
	 XdqACjlUdiKeg==
Date: Fri, 27 Jun 2025 11:02:08 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Judith Mendez <jm@ti.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, 
	Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, linux-watchdog@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: watchdog: ti,rti-wdt: Add
 ti,am62l-rti-wdt compatible
Message-ID: <20250627-imposing-cyber-mandrill-cc67e5@krzk-bin>
References: <20250625143338.2381726-1-jm@ti.com>
 <20250625143338.2381726-2-jm@ti.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250625143338.2381726-2-jm@ti.com>

On Wed, Jun 25, 2025 at 09:33:37AM -0500, Judith Mendez wrote:
> Add a new compatible ti,am62l-rti-wdt for am62l SoC [0].
> 
> [0] https://www.ti.com/product/AM62L
> Signed-off-by: Judith Mendez <jm@ti.com>
> ---
> Changes since v1-resend:
> - Binding: order compatible alphabetically

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


