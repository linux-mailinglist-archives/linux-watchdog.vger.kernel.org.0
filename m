Return-Path: <linux-watchdog+bounces-4006-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8391CB29756
	for <lists+linux-watchdog@lfdr.de>; Mon, 18 Aug 2025 05:25:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5482F164226
	for <lists+linux-watchdog@lfdr.de>; Mon, 18 Aug 2025 03:25:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E02B1E5215;
	Mon, 18 Aug 2025 03:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b="KCrQCv1g"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp1.tecnico.ulisboa.pt (smtp1.tecnico.ulisboa.pt [193.136.128.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BB36182B7
	for <linux-watchdog@vger.kernel.org>; Mon, 18 Aug 2025 03:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.136.128.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755487549; cv=none; b=daNQA7EpYAPJ86c5jaacb8o8pvOvnJWRRZhUic439cqQFxB1/XbBip5kjl8NxBoA1W/TXXgvZs0jUAfz0ZDzlUDjYmfKb8lZDYxiYWaqTjWYroy73lub0tXZqF5BqjWvlbqSCbAUOt884W2YbiDifCCGDXwpaiO6UMbKunCRwuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755487549; c=relaxed/simple;
	bh=HibKubJ0xrtQPGFeP8z0KnIk/HzT2x3GblsgTxjPM9k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PoQ1LyxYmcgKIjHYljJ5mqD9baduYS6X95qREPDm1KCQmXG7F6bwZ6u8ycitdxVLo4riMhpQo4tLmbJATMCld1TzVL1KCGPQDI3OfgBjuKupABog1/Qz8TxG0RIC2kQQcBFaJMIXVXGAMldJ+sISbzUbAJcZp993QzIXV6C6JY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt; spf=pass smtp.mailfrom=tecnico.ulisboa.pt; dkim=pass (2048-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b=KCrQCv1g; arc=none smtp.client-ip=193.136.128.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tecnico.ulisboa.pt
Received: from localhost (localhost.localdomain [127.0.0.1])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id 69A836000411;
	Mon, 18 Aug 2025 04:19:22 +0100 (WEST)
X-Virus-Scanned: by amavis-2.13.0 (20230106) (Debian) at tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
 by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavis, port 10025)
 with LMTP id scmKImj60fBu; Mon, 18 Aug 2025 04:19:20 +0100 (WEST)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt [193.136.128.10])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id CE4A7600086A;
	Mon, 18 Aug 2025 04:19:19 +0100 (WEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tecnico.ulisboa.pt;
	s=mail2; t=1755487159;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HibKubJ0xrtQPGFeP8z0KnIk/HzT2x3GblsgTxjPM9k=;
	b=KCrQCv1grmi8vXwIBJd3wzOBFj5RT264WrbyCamOO0Idq9IGXvlNDh6FfFGcwdcNCxeltB
	cIMTCGX5n9N83IlAhnaH0ZeiAuH0zD6sfZMgtp4wBG3s7ENaZVjEGyXKJeYdzl0w1HGw2Q
	0cn4kDV7ocHHjNgrKN9q0w961L3TCv7WiVo9CMTv4ymPjWNV2nJgaTW7M6StFt+3JgGyVm
	2LJz7bX8beOqVRaLjN8RGvwgObF8ISVxKmjQom4LDrxuORZ5n2+tyK9ed7vgiaUb3GPx+C
	ZJ4Bkr5Jbduz5BZVMGtDBc4EP8cSypbaXGcXAuRGLRBeBVpOMQuNkCoOhHul3w==
Received: from diogo-gram (unknown [86.48.13.205])
	(Authenticated sender: ist187313)
	by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id A0127360070;
	Mon, 18 Aug 2025 04:19:13 +0100 (WEST)
From: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
To: linux@roeck-us.net
Cc: cooleech@gmail.com,
	diogo.ivo@siemens.com,
	linux-watchdog@vger.kernel.org
Subject: Re: Bug with intel_oc_wdt kernel module
Date: Mon, 18 Aug 2025 04:18:38 +0100
Message-ID: <20250818031838.3359-1-diogo.ivo@tecnico.ulisboa.pt>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <080da693-87ae-4d21-bde7-9580c27d5268@roeck-us.net>
References: <080da693-87ae-4d21-bde7-9580c27d5268@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Guenter, Petar,

Replying from another e-mail account as the work one is not working atm.

My sincere apologies for the gross oversight. You are obviously right,
thank you for reporting and fixing the problem. I have tested Guenter's
patch on my machine running a modified version of the driver so that it
always hits the locked path and can confirm that the patch fixes the
error. Can you confirm this as well Petar?

Again I apologize for missing this in testing, I will be more thorough in
future occasions.

Best regards,
Diogo

