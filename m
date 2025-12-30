Return-Path: <linux-watchdog+bounces-4745-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 53EE8CE9AD7
	for <lists+linux-watchdog@lfdr.de>; Tue, 30 Dec 2025 13:34:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 27C1D300532F
	for <lists+linux-watchdog@lfdr.de>; Tue, 30 Dec 2025 12:34:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D1A327B357;
	Tue, 30 Dec 2025 12:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qhxh4TSB"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F5172E92C3;
	Tue, 30 Dec 2025 12:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767098087; cv=none; b=iKha2GfFX03vy7iw2EQww+pBIBiuoC76BZ81vXihd7np9es2rToGXULJTWho5Vz+FCfuDuocecJ9q0LryjHgze8PbvzIazaDMLj2LL5J5m3kw8NT48XvI3WUr2vFsr+31Z0TihNMrBNt59AnrUPqiLIENv6hhW/NRwpGZ9jffBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767098087; c=relaxed/simple;
	bh=uhitdrdfjsFDdtWcu4vCn5M/fst89AUW/Vqwl7/eiUY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rSDG7Y8bpDx4fmlAIisI54Dh7ErG4uUYa8rBm1y2Ee5vnLtTWVN/oWUhQQtxAWAfDuaXX0uHrNXC/Y9QRZe5n5cEbW9rcOwHJz8u6j1a8cCltWopDIJA5kIWgevwIF9XApXfMi/ZQcf4vJRFYLC9OThy9QCd6FjPH4DncoXGuEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qhxh4TSB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8D31C4CEFB;
	Tue, 30 Dec 2025 12:34:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767098087;
	bh=uhitdrdfjsFDdtWcu4vCn5M/fst89AUW/Vqwl7/eiUY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Qhxh4TSBjITakOzATPI30S88W6QM2clrGe1xkuaiqRkYJl5oj5ja9vlfwXvwkIfMM
	 DSmxa3dZngTRzsmNFLPVOP54wmza+9PIoKHUbCW71YS5uoJbTWi+9Lhfz+2oK91EGp
	 9JvW6Ejl9VztudLi9Cy76sTlVF7kCraW84Lw9ILfiqik/r7XYi6ERe2h/URSWMXR7m
	 xYdmSAfvBO10dqaJj+C5xXz78fskOq5Y3E8kOXGF21Fb3EJXn9zt4OhhQRK+Mm+wZX
	 YLUbR6nY3Kwr/50v6zJJSMCrUXv5pCQwHXQSmvNNd204F6fRLLGoynLheUn0D07bze
	 CbZ/zBE3wBhmw==
Date: Tue, 30 Dec 2025 13:34:44 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Nandor Han <nandor.han@gehealthcare.com>
Cc: wim@linux-watchdog.org, linux@roeck-us.net, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, linux-watchdog@vger.kernel.org, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] dt-bindings: watchdog: fsl-imx: document continue in
 low power mode
Message-ID: <20251230-hidden-okapi-of-reputation-6ef8be@quoll>
References: <20251229145000.421426-1-nandor.han@gehealthcare.com>
 <20251229145000.421426-3-nandor.han@gehealthcare.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251229145000.421426-3-nandor.han@gehealthcare.com>

On Mon, Dec 29, 2025 at 04:50:00PM +0200, Nandor Han wrote:
> Property "fsl,wdt-continue-in-low-power" allows the watchdog to continue
> running in low power modes (STOP and DOZE). By default, the watchdog is
> suspended in these modes. This property provides the option to keep the
> watchdog active during low power states when needed.

And why exactly would that be a DT property? If system is sleeping
(assuming this is what you meant by low power), no one will pet the dog,
thus watchdog makes no sense.

Otherwise I fail to see how this is a hardware property and we do not
accept SW properties (see writing bindings, numerous presentations).

Best regards,
Krzysztof


