Return-Path: <linux-watchdog+bounces-2661-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 04805A0307C
	for <lists+linux-watchdog@lfdr.de>; Mon,  6 Jan 2025 20:24:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DF36E161FD9
	for <lists+linux-watchdog@lfdr.de>; Mon,  6 Jan 2025 19:24:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D00A314AD2B;
	Mon,  6 Jan 2025 19:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KdOElWwt"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C5D0171D2;
	Mon,  6 Jan 2025 19:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736191469; cv=none; b=Kb7eGsranKWF4XZs1ctzVfa8oT5GkvBT5CQ9KMHlwRg3a6jtYQjiuOTrpyv1R4q36ae0PtVxfCvUdbyfuozRL+xeYCJZeOelAxaiVvJj2SzrDnTNN0J9J+XffnuRYqlnAZVLlBlgAcIV5hFfpmK243tv8/tHr6qKSWgE9zqrTho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736191469; c=relaxed/simple;
	bh=GcouBHEnO0wTqP5GPp1mlQybUrfCiP4EjWCG0+l0IBY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PDVoKqwCpJdkgHXbPXUrpYlLwgcKmlrdRng42lqtMtSnyt224yepu0qk59kztLl93HMlpr2nxBeVzK/6+U+0Lju3p9PTT8a5XBA6EuKhYWPIYpEjnWJQDh7nlDkhYWn7VJNVIvCicG05EqIy6oYEHLOqI2X9QabN5bnHRkgx7ZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KdOElWwt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49439C4CED6;
	Mon,  6 Jan 2025 19:24:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736191469;
	bh=GcouBHEnO0wTqP5GPp1mlQybUrfCiP4EjWCG0+l0IBY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KdOElWwtCfqlBry7uTRNaBvt6Z2vh+PisYp+FcX71GNa6nNw4YkVNYDqD49tDY+YG
	 H6U5HlDc7QSWoidd4CrJpJgbu49gqSVQF8B4pg25cxvOyWwNJgjYHbCIlex2tzCHDh
	 UI1skaTUyGdzfzWspD+kO3tG9ACM5B08ET0KI+pn8cc7xM+ShgeSVGfGw3ms7za2aw
	 cvVESDUxQwtqD+wpoQtawpuZTo8rjCH/5zo3IUViU7UWyN55l605feytt3TC7+y09L
	 BgpWaVw5CNi3c7EhlhJkL/U6UoZAD8H14RhY+iftxqcbOlPPlh3IrtowNZBml2XaAS
	 921U/TJ+a397A==
Date: Mon, 6 Jan 2025 13:24:28 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
Cc: linux-watchdog@vger.kernel.org, quic_srichara@quicinc.com,
	linux@roeck-us.net, devicetree@vger.kernel.org,
	andersson@kernel.org, quic_rjendra@quicinc.com,
	wim@linux-watchdog.org, linux-kernel@vger.kernel.org,
	conor+dt@kernel.org, konradybcio@kernel.org,
	linux-arm-msm@vger.kernel.org, quic_varada@quicinc.com,
	krzk+dt@kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: watchdog: Document Qualcomm IPQ5424
Message-ID: <173619144480.836740.2156533062837713983.robh@kernel.org>
References: <20241120055248.657813-1-quic_mmanikan@quicinc.com>
 <20241120055248.657813-2-quic_mmanikan@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241120055248.657813-2-quic_mmanikan@quicinc.com>


On Wed, 20 Nov 2024 11:22:47 +0530, Manikanta Mylavarapu wrote:
> Add devicetree binding for watchdog present on Qualcomm IPQ5424 SoC.
> 
> Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
> ---
>  Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Applied, thanks!


