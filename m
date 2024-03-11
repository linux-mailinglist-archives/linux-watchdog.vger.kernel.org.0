Return-Path: <linux-watchdog+bounces-776-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3055A878A7D
	for <lists+linux-watchdog@lfdr.de>; Mon, 11 Mar 2024 23:05:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6202A1C20A7D
	for <lists+linux-watchdog@lfdr.de>; Mon, 11 Mar 2024 22:05:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EB6F56B98;
	Mon, 11 Mar 2024 22:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicksendemail12.com header.i=@quicksendemail12.com header.b="fiZBBS0q"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from quicksendemail12.com (quicksendemail12.com [51.38.114.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16AFA56B90
	for <linux-watchdog@vger.kernel.org>; Mon, 11 Mar 2024 22:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.38.114.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710194736; cv=none; b=rZPwm8BFLhbwq/pMP7tp92BL2bCr1H5WUBNhucDw4ePHF3VGvMrony93AqlThNyDBEn1AgFhCv5C0XYou+qm9QXdcivoFEhpq2qiy7wj0TkG7O01zyifsrRc6i4gzmbkUiBX6szBj/X7vj4Q/ExzNAGGOed4JnQqyptUb1eeoSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710194736; c=relaxed/simple;
	bh=Q15fz6lzzNe4EYwFl5FQjiNsdVb8Y8Mc2ihtRAeMMGA=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=E0XNmxYyz/VOa01iE9hYRLw18w0nS60MY86elCIdn2b1JUkYNMYZNaCf80BYJxSCJbPCSUz3+ia0/wZdiuQveJIYxNAoyL4gxbu8BDmcAQwGWzxJ0UPRjHn6venKpQVZ3BmnZ44KsHC6B8z8H98XEn7Ut8kLkt0yngOZBSfzkFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=quicksendemail12.com; spf=pass smtp.mailfrom=quicksendemail12.com; dkim=pass (2048-bit key) header.d=quicksendemail12.com header.i=@quicksendemail12.com header.b=fiZBBS0q; arc=none smtp.client-ip=51.38.114.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=quicksendemail12.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicksendemail12.com
Received: from 198-12-114-80-host.colocrossing.com (unknown [198.12.114.80])
	by quicksendemail12.com (Postfix) with ESMTPA id 569D4109D64
	for <linux-watchdog@vger.kernel.org>; Mon, 11 Mar 2024 21:51:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 quicksendemail12.com 569D4109D64
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=quicksendemail12.com; s=default; t=1710193914;
	bh=Q15fz6lzzNe4EYwFl5FQjiNsdVb8Y8Mc2ihtRAeMMGA=;
	h=Reply-To:From:To:Subject:Date:From;
	b=fiZBBS0qcbhYUgSL/OnEGkusyn8AKTU3NfXiJGhfJWA/BiA+MJhuLQV5VWWp6I49p
	 F9C1foAXdSVQDsjyco4omAbc+bQUN+Sz4FzzNqHOBRihF9ARwaB2V8G06dqdv/hzLe
	 A2AlMgYqPfyfUMrvl7wo63z8gKwcrMU6c1oNJczHlTBcT9XGPEULo+h8kDC6PS7B6w
	 YZE5UgvMbf2dH7m4Tdr2A/9KdXm/47RIBL9mtqSs5Abrc41oVhAt+TaqMSQCCCcSP8
	 tCuZT4YeBBg7ruLRioMFg3FWqBvKIZqWBBsPiVt9GPXUvT0MHnib203BCaMOfPW/n6
	 I1bBdYereFKLw==
Reply-To: info@gscommoditytradng.com
From: Aminda Sebastian <info@quicksendemail12.com>
To: linux-watchdog@vger.kernel.org
Subject: Enquiry
Date: 11 Mar 2024 17:51:52 -0400
Message-ID: <20240311175151.311C3D7DF2054603@quicksendemail12.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Good day .

Please email us your company's most recent catalog. We would like=20
to make a purchase from you.
Looking forward to hearing from you.

Aminda Sebastian
Purchasing and Quality Manager
GSCOMMODITYTRADNG S.R.L
Parque Empresarial V=C3=ADa Norte, C. Quintanavides,=20
21, Building 5, 28050 Madrid, Spain.

