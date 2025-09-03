Return-Path: <linux-watchdog+bounces-4159-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 412E5B41DA4
	for <lists+linux-watchdog@lfdr.de>; Wed,  3 Sep 2025 13:54:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 847067A3D44
	for <lists+linux-watchdog@lfdr.de>; Wed,  3 Sep 2025 11:52:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76F241DB375;
	Wed,  3 Sep 2025 11:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siemens.com header.i=diogo.ivo@siemens.com header.b="WvveLKes"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 468D42FD7D7
	for <linux-watchdog@vger.kernel.org>; Wed,  3 Sep 2025 11:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.136.64.227
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756900180; cv=none; b=q1O37tM7Bbfce0cA3VMHz7OBrOxWalKeI6K51B2VhfbrEWenF7vqJotSVJhfPeoYt+R/r9zew7pB82vkvMCRLLuFp2mHmmnMf3DI4mIgUFYl9a/AvQ0G5DDTsbTV43zmv487b0guAAkvic6VvK4CVsmNeFzzMIRdtG7HMrcOMys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756900180; c=relaxed/simple;
	bh=lAES3l1X86OVKuPilKHpXG8FldhrlZD7TQNJOVUKmI0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JS0wUdV5ZMwSYgp4whpAvoLpxI3nI2G0LDM5Cs99fBddKC8rFW3KRIbBw0SgUZXezk4Z2q5NjJkwkxY2mN0reiPAAhSRc0LfjTeinnrXyS3w3oLv7kve/rwU7YN8veAmZOIedFnN+jBHjzNEvj73wl/80IhtOPSQCtL3aWVqIYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com; spf=pass smtp.mailfrom=rts-flowmailer.siemens.com; dkim=pass (2048-bit key) header.d=siemens.com header.i=diogo.ivo@siemens.com header.b=WvveLKes; arc=none smtp.client-ip=185.136.64.227
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rts-flowmailer.siemens.com
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 2025090311492628deaa0c6e0002070e
        for <linux-watchdog@vger.kernel.org>;
        Wed, 03 Sep 2025 13:49:27 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=diogo.ivo@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=lAES3l1X86OVKuPilKHpXG8FldhrlZD7TQNJOVUKmI0=;
 b=WvveLKes9QJ/d2n1BsRan1Y5xhEsGirWF5TZRyHSElxQPmolzm18gU+WN7j+1s9+CoJKKQ
 RHrSL+pf0belzVDD697IPN4iYqjkc5LaeTDK3hx9OsuBdfm6ohrRwL+JJMXksnOqbxaQdEd6
 36n402rVxNEhwxigbEk62RB6iUhPCicbyqszbM9cOtJ2njXWokYHWhXyD75WhP1MRpTfeIWU
 rXgfTwRyiLmp4BlRl/1+OhpNcAKdcbSRxWp+3nFnx1EbjWGMr7RdLl8fMQlw1ie0FelZ/xEz
 ItHN76kI48UeHYZPQ2YYIS/avFxnXOz2/YETfBxOmww86IkcOYpBMIKw==;
From: Diogo Ivo <diogo.ivo@siemens.com>
To: linux@roeck-us.net
Cc: cooleech@gmail.com,
	diogo.ivo@siemens.com,
	linux-watchdog@vger.kernel.org,
	wim@linux-watchdog.org
Subject: Re: [PATCH] watchdog: intel_oc_wdt: Do not try to write into const memory
Date: Wed,  3 Sep 2025 12:49:05 +0100
Message-ID: <20250903114905.40656-1-diogo.ivo@siemens.com>
In-Reply-To: <20250817144817.1451377-1-linux@roeck-us.net>
References: <20250817144817.1451377-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1328357:519-21489:flowmailer

To make it explicit with my comments on [1]:

Reviewed-by: Diogo Ivo <diogo.ivo@siemens.com>
Tested-by: Diogo Ivo <diogo.ivo@siemens.com>

[1]: https://lore.kernel.org/linux-watchdog/20250818031838.3359-1-diogo.ivo@tecnico.ulisboa.pt/T/#t

