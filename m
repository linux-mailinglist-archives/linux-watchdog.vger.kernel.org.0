Return-Path: <linux-watchdog+bounces-4394-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 70C52BDE818
	for <lists+linux-watchdog@lfdr.de>; Wed, 15 Oct 2025 14:39:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CA24119C3D96
	for <lists+linux-watchdog@lfdr.de>; Wed, 15 Oct 2025 12:39:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA9BE1E487;
	Wed, 15 Oct 2025 12:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aADQLKwn"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEF7C182D2;
	Wed, 15 Oct 2025 12:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760531966; cv=none; b=npGZI9gwx/zBPOSEc0ZSr+C5FJ3zH0fJueyXqSRWakJ+vN0RrZ1hgmRXAwyiBc0WLhc8Gmon8MPbEoR/Dij9/kOirp7qEULKYEy9GmY4Ir0bTtGUpirfl5m+wRcA2B5W/jhCfWjqEAafONB8aZkvPbbELeaVgK9qoADg5nj2HMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760531966; c=relaxed/simple;
	bh=O4vy5PSXyIGPiDBPil6snETDgyGJ9ca0rxgId+YGngw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FIODCUtDVEYUS3h2af1H+trtfXd0QjCuDbCYyY36X3MdmgKZba5xvVWi4XmaLQDb5+pQ9mB6ly8iktZymymPywq4kVnQOUOXH2078vk3zGc8jdBl17IGNMyNMvOGTIlY+Ove24qiW+7XYAg7lm6ii87JLGEvbl1J58afJL5ZCig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aADQLKwn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AF81C4CEF8;
	Wed, 15 Oct 2025 12:39:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760531966;
	bh=O4vy5PSXyIGPiDBPil6snETDgyGJ9ca0rxgId+YGngw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aADQLKwn0O0etKEqQQ+te27f5Oajw9gR9Exbma95Xn1NrWBIo/sS40/JhgBFHYNPq
	 zuJi90mAD3JBoVaZWRht4dAbJvomp0Ynmh/1RwE4PtotlI9jDhsdDEv1JEMlbcpFnf
	 Geo6XGPmXHW1prv+ZSjTV3NAJYD2YoMYT0f4SI2wRAe/3ykfGrtKEhEVKTTtXlFnyb
	 XXv955yEJKhW5MqOUKOpmD3U5LoiTcNHisZrU9fStcr0ZtunBhk9kvqRSEZXsxHME7
	 oNmbA1ZXd87mLoyJ8aIgfeCrSoDcx7VhNgdOg7pv5sVvtAYaDZv5rz75Xcl59zPy/2
	 OOgbiVL/zBA6g==
Date: Wed, 15 Oct 2025 07:39:24 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
Cc: linux-watchdog@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
	andrew@codeconstruct.com.au, krzk+dt@kernel.org, linux@roeck-us.net,
	wim@linux-watchdog.org, linux-kernel@vger.kernel.org,
	joel@jms.id.au, linux-arm-kernel@lists.infradead.org,
	BMC-SW@aspeedtech.com, conor+dt@kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: watchdog: aspeed,ast2400-wdt: Add
 support for AST2700
Message-ID: <176053196354.3197283.4565101517229903275.robh@kernel.org>
References: <20251010080315.816628-1-chin-ting_kuo@aspeedtech.com>
 <20251010080315.816628-2-chin-ting_kuo@aspeedtech.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251010080315.816628-2-chin-ting_kuo@aspeedtech.com>


On Fri, 10 Oct 2025 16:03:13 +0800, Chin-Ting Kuo wrote:
> Add support for the AST2700 SoC in the ASPEED watchdog device tree
> bindings. This includes:
> 
> - Adding "aspeed,ast2700-wdt" to the compatible string list.
> - Extending the "aspeed,reset-mask" property description for AST2700.
> - Defining AST2700-specific reset mask bits in aspeed-wdt.h,
>   covering RESET1 to RESET5.
> 
> Signed-off-by: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
> ---
>  .../bindings/watchdog/aspeed,ast2400-wdt.yaml |   8 +-
>  include/dt-bindings/watchdog/aspeed-wdt.h     | 138 ++++++++++++++++++
>  2 files changed, 144 insertions(+), 2 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


