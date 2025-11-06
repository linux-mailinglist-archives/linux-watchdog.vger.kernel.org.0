Return-Path: <linux-watchdog+bounces-4521-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 8299FC3BD9F
	for <lists+linux-watchdog@lfdr.de>; Thu, 06 Nov 2025 15:47:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 8ADAE5061A7
	for <lists+linux-watchdog@lfdr.de>; Thu,  6 Nov 2025 14:41:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E552933EAEC;
	Thu,  6 Nov 2025 14:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bJzhusTp"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD57832B9B8;
	Thu,  6 Nov 2025 14:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762440015; cv=none; b=oL5vxI1YLOwWR1n27ZE4azYZ2nD1XtyIb+DJrv3k4ePkAm5hzBQLgColwMQIhrD9mcvXa1+Mc58P4400OXP6g+w1FId9OOqD0apLhp8BvjBsuFUDBuH3CAN6ZfCq8B8XtoFMMPqYWDBj6v1i6CJUd/z0ykRRc9nlKKeHYRdFfoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762440015; c=relaxed/simple;
	bh=fFnhH3q3Icm3DP1JyQQxr8q/0KF3GHFVisTWyJ1PGkw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D+Ym13jRS3xKtplAE2GOSRP2IvDHlWpjZVzEezOOqfQ7oO12SrQf9JxcqsvJCsFz/tdpl27ZxlzcCcEvS53iyDSfUe4T7JjU06FZpdIDN0c4crRQDJ3xHS7/hLqwBs/++F6tBaI5rQwGjIf20Upr1SdnTdYGmGpAlJjiJ3Vy3h4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bJzhusTp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C80FEC2BC87;
	Thu,  6 Nov 2025 14:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762440015;
	bh=fFnhH3q3Icm3DP1JyQQxr8q/0KF3GHFVisTWyJ1PGkw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bJzhusTpVGP+R3O679bZrwiq6Fsad1s2aWWf5o2hYpRisWipOhoEK37XnFto6RTwQ
	 NgYVV+4aaBIEP8e/cXfOcFpG4+/Om+rN7CN/wzF5gcu4zthfRFC8E6wyyyfI7zrH6N
	 RJGPeUqxwr/IoCND0WLCTerLRMp9/hd8tvXsNX0tUzqRCbELEasqyIuD+I6XTgYjuX
	 PQtbA4Vc91yQiysLsS7DwUICzDlVBx4wLGFpFE8ApG9R4X5OwOBj0WQFWrJOitgPCd
	 QYxYqR1//6xG6Heo0LIEvtjFeFbL6FYPOdWPKCHGHRwdFoNEcFcnSdOjxZsIMBkFqQ
	 ssObCoBRQTGsA==
Date: Thu, 6 Nov 2025 14:40:10 +0000
From: Lee Jones <lee@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Timothy Pearson <tpearson@raptorengineering.com>
Subject: Re: [PATCH 3/3] dt-bindings: mfd: rohm,bd96801-pmic: Correct
 timeout-sec length and reference watchdog schema
Message-ID: <20251106144010.GS8064@google.com>
References: <20251020-dt-bindings-watchdog-timeout-v1-0-d0f3235eb327@linaro.org>
 <20251020-dt-bindings-watchdog-timeout-v1-3-d0f3235eb327@linaro.org>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251020-dt-bindings-watchdog-timeout-v1-3-d0f3235eb327@linaro.org>

On Mon, 20 Oct 2025, Krzysztof Kozlowski wrote:

> The parent node of ROHM BD96801 PMIC is also holding properties for the
> watchdog, thus it should reference watchdog.yaml schema.  OTOH, the
> timeout-sec property is used only as one number.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> This depends on previous watchdog patch.  I propose to take entire set
> via watchdog tree, with Lee's acks.

Sure.

Acked-by: Lee Jones <lee@kernel.org>

-- 
Lee Jones [李琼斯]

