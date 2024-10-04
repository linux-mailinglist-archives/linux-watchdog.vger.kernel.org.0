Return-Path: <linux-watchdog+bounces-2075-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E341B98FDE0
	for <lists+linux-watchdog@lfdr.de>; Fri,  4 Oct 2024 09:34:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AABF628436D
	for <lists+linux-watchdog@lfdr.de>; Fri,  4 Oct 2024 07:34:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B05F8286F;
	Fri,  4 Oct 2024 07:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t5LQrL9A"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5F5B81AB4;
	Fri,  4 Oct 2024 07:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728027268; cv=none; b=f8oscvWefSO9y+ATSuysNSHq5uoHqVgeTVbB2qeDVVTi6fsgng6dr/SreL/INgLwKO24hsFLJXFbQ5l3LX/CGUz71eIVXKaqS7ltm8y5BK0lZ7UQiQwyr69+JldpBjO7LKw+8MiWVwFS1ynhU35bt9pux4Kau6+0AypqFy3lXoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728027268; c=relaxed/simple;
	bh=uxs+nS4ovmqfmgWsESycOMJFJWQ0CwLd1wPsOwEBxnA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=obnWu/RueF07tEDUoEtJlQKl0JvLwA/g9E+ndQu1rax/sCfV1Q8bPEO0UjOTd2vZI9d/NdC1y4BoGAcJrMV8Rg5eIW4I7pqZL/q+1l+Jn+vmJlFt0pQxQokoVTY0Yq9cbVF8BeQosbE0iYu6f3UZpk44qro3KxWQEFTrTLzl1cI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t5LQrL9A; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFEEEC4CEC6;
	Fri,  4 Oct 2024 07:34:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728027268;
	bh=uxs+nS4ovmqfmgWsESycOMJFJWQ0CwLd1wPsOwEBxnA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=t5LQrL9AfWId2Nm01qYP8hqvuxbyBcXc1cC6Jz3PgdNJDlstRaZZ3DyjWy3jF/Jsn
	 2phXOKuyMBRWveHvPh7uajkewaiT9iMTaOgSIowgZjMYz+6fem8DPyQK2cdBhtYoR3
	 CRXQalSSpFYKzauGkstETZdAKjKK9aIU15heCJlNxVzjtLqCRBBhlkjVy66M0MTr3L
	 hNWRHWYXDTMWY/8YN+uq1+vctVRTtTU3uhOjax1YG8vHhHFsSp80yHKxGvrlJC9Rwu
	 SP5cwoD+7pi3CWfYTrLLAPe8PCFpsDPH+IIvlVe37ecJZzzZa3wO6cGDf5tsjl2LcJ
	 IRwcj4vUWWi0w==
Date: Fri, 4 Oct 2024 09:34:24 +0200
From: Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-watchdog@vger.kernel.org, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] watchdog: armada_37xx_wdt: remove struct resource
Message-ID: <3vkr5to2sziashaksmlkmkixqwxa53rj2lzepi6hz4ehc3g45m@oqu5lfiyfm2g>
References: <20241003214508.121107-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241003214508.121107-1-rosenp@gmail.com>

Reviewed-by: Marek Behún <kabel@kernel.org>

