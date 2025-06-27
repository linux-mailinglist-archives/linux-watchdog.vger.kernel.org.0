Return-Path: <linux-watchdog+bounces-3756-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C915AEC0FE
	for <lists+linux-watchdog@lfdr.de>; Fri, 27 Jun 2025 22:31:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7E2785633C9
	for <lists+linux-watchdog@lfdr.de>; Fri, 27 Jun 2025 20:31:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8913D2236FD;
	Fri, 27 Jun 2025 20:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B7Dp6gGN"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 596AA214A8B;
	Fri, 27 Jun 2025 20:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751056266; cv=none; b=QTm2xmngEIe5Ui74IpdoGYb6iCxAhlis3dB4g9ULWRRclPYkT5WR60pZCkzV+gOgnIdvO+bhuadBrSiT61dUIG9HZX4W9YU+3HoZozQBfzvR6YA/HqI2xzdHzXwjIdebGOfqeFGmw7ozUjCyAcOaDNKAwyglfn3fy4oFsrDEcSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751056266; c=relaxed/simple;
	bh=chIjgY/DRXU+aobNz+GV9xajKaVjC+6hRM85uhsc/qI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oE2ZkVnapcq5PQFNU6nXJ5JRy9730m7yGXK8TryM7C8rvPlXDCFiXzwMbBde4b4lHSR+R+YNkZ0CLn9yDSs7Pnq+C/clbDi97O+dRbd39iLkn+ovTxfH0iDJk6l9unT4t0+kcw+fd9erXkR4i7rSzm3aZumPnV86QbA4WD4ubeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B7Dp6gGN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF932C4CEE3;
	Fri, 27 Jun 2025 20:31:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751056265;
	bh=chIjgY/DRXU+aobNz+GV9xajKaVjC+6hRM85uhsc/qI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=B7Dp6gGNKtHwnvKpIrpACDdjpFI1LJ6wN+3cHi8na9/FEvZWTkeDR9lq1XI7B6l7w
	 zM7Slh6sZhZkAKeGT25yAsOYlsuLUdsqyhyTvRlykn3zitrvD6taBqJjTvq5ssvu0V
	 EukfE+y2xfXux6l2wJD8OX5oaFGWrrwpamd9ybxuCTKP4Ae1g3TDYkLqp2kWqtveRU
	 sKB/xT/xLwTNWEobFO3tzqsVc8wjX3XhVwmpLQbyZwvreNouio8nfnuCJOxgxUIgOI
	 7no4IzwmJHVPUS36kaqGBKaIHzoeBZyVkN+3j/OY86TCLcg7s+NouyQ+QrLeKiOCix
	 1MFc6XhiR/HcA==
Date: Fri, 27 Jun 2025 15:31:05 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-watchdog@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
	Wim Van Sebroeck <wim@linux-watchdog.org>, imx@lists.linux.dev,
	Conor Dooley <conor+dt@kernel.org>,
	Roland Stigge <stigge@antcom.de>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] dt-bindings: watchdog: nxp,pnx4008-wdt: allow clocks
 property
Message-ID: <175105626276.33089.3774490288241746622.robh@kernel.org>
References: <20250624201227.2515275-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250624201227.2515275-1-Frank.Li@nxp.com>


On Tue, 24 Jun 2025 16:12:27 -0400, Frank Li wrote:
> Allow clocks property to fix below CHECK_DTB warning:
>   arch/arm/boot/dts/nxp/lpc/lpc3250-phy3250.dtb: watchdog@4003c000 (nxp,pnx4008-wdt): Unevaluated properties are not allowed ('clocks' was unexpected)
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  .../devicetree/bindings/watchdog/nxp,pnx4008-wdt.yaml          | 3 +++
>  1 file changed, 3 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


