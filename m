Return-Path: <linux-watchdog+bounces-4795-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 05454D125EA
	for <lists+linux-watchdog@lfdr.de>; Mon, 12 Jan 2026 12:46:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B725D3033709
	for <lists+linux-watchdog@lfdr.de>; Mon, 12 Jan 2026 11:46:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39E3D280309;
	Mon, 12 Jan 2026 11:46:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qiaugXqT"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16E1E1A840A;
	Mon, 12 Jan 2026 11:46:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768218372; cv=none; b=Jdah7aX521ySWaRZGER40Mc0nFMsRLlUchOCRzmjHLnswFpu3lC165LGFjuyMm9bd9ZsQndabdb4WwOsr0T+TSQ4LQHxb5+8gk0pNoUR8/OIfM5L4IUZPeI0J3Og/M7b8MZZMGHMOsgh7tX4+/Tyb/Pots/A+bp8lAnpCEQY0PA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768218372; c=relaxed/simple;
	bh=LZ/lEo7NYiXncNpVV/uHEJmoFXM4eYE564fDTP0VAlM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LyyOC9gdevJBcLIiJnWXwHf9yW1cDr6iMqv+rx7yxDgnoB9ATRP2oWP5nvrKvbUOjee+1Xveu0Wpy1pp3Tm2/jjb2LmiD+Y8EevNqM8Y8FGzSDVB7ygL+RWv3DRkHMHbbiWfaOZ2s1uTcMnI4UDXbp+dhjSMiQR6t6QKYw4Pzbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qiaugXqT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2553EC16AAE;
	Mon, 12 Jan 2026 11:46:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768218371;
	bh=LZ/lEo7NYiXncNpVV/uHEJmoFXM4eYE564fDTP0VAlM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qiaugXqTRqbIr48PUhQ30wohCjXYfTX9ANtpGz4D38S2hUKzrsRPhiOmTai+4cGap
	 QTyUefWJZy4f5EFDJETJ6mElDrnyqgzTOPBqHAiWrGvfSgPNVEnrInTSL71yjmHBer
	 xukBGlwmdwr+S6Ltch3sK2mHiyAMpELO2T03RtisTUz3mPKG3sUFCA1aqCMpv8Ws8o
	 zODq7YFX/mbH/Ff99yL5HU4L18HikZ4eaRVOSXoclCfK0JP7VaPIA7PmOIYjPXJoM0
	 KdRsn5cjNMgzfyyjW7o/kweb6gN4uxejv0cgOEbFl5b7EgoZ2xEIrr19mPp+j4+8U6
	 XWUTAPv9poXkA==
Date: Mon, 12 Jan 2026 12:46:09 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: wim@linux-watchdog.org, linux@roeck-us.net, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, rajendra.nayak@oss.qualcomm.com, 
	linux-arm-msm@vger.kernel.org, linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: watchdog: qcom-wdt: Document Glymur watchdog
Message-ID: <20260112-devout-sandy-cockatoo-b0fd4c@quoll>
References: <20260111155234.5829-1-pankaj.patil@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260111155234.5829-1-pankaj.patil@oss.qualcomm.com>

On Sun, Jan 11, 2026 at 09:22:34PM +0530, Pankaj Patil wrote:
> Add devicetree binding for watchdog present on Qualcomm's Glymur SoC
> 
> Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


