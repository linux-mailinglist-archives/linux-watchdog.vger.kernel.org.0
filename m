Return-Path: <linux-watchdog+bounces-3290-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D2599A86335
	for <lists+linux-watchdog@lfdr.de>; Fri, 11 Apr 2025 18:28:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 36EEA1BA7805
	for <lists+linux-watchdog@lfdr.de>; Fri, 11 Apr 2025 16:27:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 664BE21C183;
	Fri, 11 Apr 2025 16:27:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oG6lQwmT"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33E78126C13;
	Fri, 11 Apr 2025 16:27:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744388849; cv=none; b=RPG8Jk/Azs7wRK/XnevCZs0U+/Sz674jViJ4HtDZO5tgcXXf4GjdDrRCRhsVuFmg/FoNiev7EEauT5Ebu2W/o/hhu7w4wSHGIMS8ldOfLvSaXaZzXpVR7TmHpzoa4wqjVaU6dFW2BtY1OwMa03h+68bhWc64B8UD5dwBksuTJAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744388849; c=relaxed/simple;
	bh=K9YklQV3sZeGkvQCnk8vyo8gH21v85wMrdiKe2oanQY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k1E7wZVLhcmFdSR8BRuIkuXxnQcrV+MDOihmp0w1hJsSvjlYRRfHC7/ANhFXwVjSl9hZfj/Q1SAlWUQhWDLHCjGhXn2rR4AZfVZtLTKk4krp6Vl7tqt65qKzyWvFB3MMqXuotNPNLj7vDoGqnmFoyyLrgct7i/vAEf5+mfoH7bw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oG6lQwmT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B64AC4CEE2;
	Fri, 11 Apr 2025 16:27:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744388848;
	bh=K9YklQV3sZeGkvQCnk8vyo8gH21v85wMrdiKe2oanQY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oG6lQwmTKOS0X8RlZW4NpeBewH2Z3zY4J3O+uNJE71aMgHOPlyy8T+NbACbfGQ9RT
	 B83PdMO3CgG7zSVLA0lHYzDcxb5vE/yBL52EYjnJ4wE8y5jjjTAZlagUMlJdf+N8qu
	 UjHv9gponRKctbffQcVc4eYB6FLgSrWh/qe63vNzD6dFTlkWLbh7toMI/3JSyN0DAd
	 aCqcFcJZ0WW5sLMTk/i/S8LiclyoZsTJwLISvjfvRfCds3Lrvp1M87QnyjacCJlmtN
	 FMdGfgOKsjDAqGrfbmmDhTfAc1h1ohT76R8FuqOjNIHN9JVUAvnKUMl+gGn2KeBVHE
	 Qz9hzTXmMcalg==
Date: Fri, 11 Apr 2025 11:27:27 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: linux-watchdog@vger.kernel.org, conor+dt@kernel.org,
	devicetree@vger.kernel.org, alexandru-catalin.ionita@nxp.com,
	linux@roeck-us.net, krzk+dt@kernel.org, ghennadi.procopciuc@nxp.com,
	S32@nxp.com, linux-kernel@vger.kernel.org,
	thomas.fossati@linaro.org, wim@linux-watchdog.org
Subject: Re: [PATCH v4 1/2] dt-bindings: watchdog: Add NXP Software Watchdog
 Timer
Message-ID: <174438884676.3345035.7521977412397143761.robh@kernel.org>
References: <20250410082616.1855860-1-daniel.lezcano@linaro.org>
 <20250410082616.1855860-2-daniel.lezcano@linaro.org>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250410082616.1855860-2-daniel.lezcano@linaro.org>


On Thu, 10 Apr 2025 10:26:13 +0200, Daniel Lezcano wrote:
> Describe the Software Watchdog Timer available on the S32G platforms.
> 
> Cc: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
> Cc: Thomas Fossati <thomas.fossati@linaro.org>
> Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
> ---
>  .../bindings/watchdog/nxp,s32g2-swt.yaml      | 54 +++++++++++++++++++
>  1 file changed, 54 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/watchdog/nxp,s32g2-swt.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


