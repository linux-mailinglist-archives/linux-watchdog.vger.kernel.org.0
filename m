Return-Path: <linux-watchdog+bounces-3568-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C1CDAC0450
	for <lists+linux-watchdog@lfdr.de>; Thu, 22 May 2025 07:58:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 999FCA20744
	for <lists+linux-watchdog@lfdr.de>; Thu, 22 May 2025 05:57:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67F341F237E;
	Thu, 22 May 2025 05:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marvell.com header.i=@marvell.com header.b="CkRQRT6B"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0b-0016f401.pphosted.com (mx0b-0016f401.pphosted.com [67.231.156.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B54D91F1522;
	Thu, 22 May 2025 05:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.156.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747893473; cv=none; b=HbEoNjSUrK5Cn24ZUyUZGEgb8B2ghUH2o6d8ESkkjwIS4/Vyj5HHpPfTKaaoHbah+SCi58UzeLOMRNpWlKhYszkkN0eVb6RYpGNe2Du+gbZyRl2VJvHjRccvmTyAb6V5RZOP85u3a7S71jeY1bqnIUm9jOZCBQON35/PujoQQrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747893473; c=relaxed/simple;
	bh=kPn6f5OVoMXmjB9v5cahFg/5FN5tZ2/LXTi7N789Qj4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=WzR8r4WckwcrixpopYeNYHG/s+IyuElVfqLJPVUEuVjBdZv9JnIYKcH0XBu7yHdr5x1p7OeCXvNsSv+QLRk/r+Og34OPiLC670GUW371vvpKHO+nfgSXorVnuA2KKtFqj33gvY9Vx+7DJIWr5fgqVyFuv4wFB4TSHhSmT37/6Ng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com; spf=pass smtp.mailfrom=marvell.com; dkim=pass (2048-bit key) header.d=marvell.com header.i=@marvell.com header.b=CkRQRT6B; arc=none smtp.client-ip=67.231.156.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marvell.com
Received: from pps.filterd (m0045851.ppops.net [127.0.0.1])
	by mx0b-0016f401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54LDroib017518;
	Wed, 21 May 2025 22:57:33 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pfpt0220; bh=sdKdexUtu+kW9QMg27XpY6n
	DojyNHDcE+TCJCItY2h8=; b=CkRQRT6BRUisdtBIKN8vhmfwKclGRzMTsN2ApQB
	CupEQi3TUeD4AsmRCh1+Q9UVEodHX+1fra2vNeM6yuXTFyEepRi6MHtzpk/mUKiW
	/VaYrJg55HeF3DpysSAWwh8hdBCk+U57pk0sE8sPVEqzpucU89InMGzU3r9OjW0k
	d7FOFg3Sut9NdP9ye4rM51szc5dDZwUTckl6aZ0Ii7tMw9lfqIxgUtT3Bb72LIvp
	LcwvvgbV1omBZ/Y1ZTmLHnxypFVW3n8xAMI4S1Frb8U0eG5lwOToS0JdiE8RMj+G
	eUYD9/y+vguSlkRHr49hNcSFNuUJRUJpfCr40q+H4TushFA==
Received: from dc5-exch05.marvell.com ([199.233.59.128])
	by mx0b-0016f401.pphosted.com (PPS) with ESMTPS id 46rwfgkvn4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 May 2025 22:57:32 -0700 (PDT)
Received: from DC5-EXCH05.marvell.com (10.69.176.209) by
 DC5-EXCH05.marvell.com (10.69.176.209) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Wed, 21 May 2025 22:57:31 -0700
Received: from maili.marvell.com (10.69.176.80) by DC5-EXCH05.marvell.com
 (10.69.176.209) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Wed, 21 May 2025 22:57:31 -0700
Received: from tx2-sever.caveonetworks.com (unknown [10.110.141.15])
	by maili.marvell.com (Postfix) with ESMTP id 848AE3F708E;
	Wed, 21 May 2025 22:57:31 -0700 (PDT)
From: George Cherian <george.cherian@marvell.com>
To: <linux@roeck-us.net>, <wim@linux-watchdog.org>, <a.fatoum@pengutronix.de>
CC: <linux-watchdog@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        "George
 Cherian" <george.cherian@marvell.com>
Subject: [RESEND PATCH v5 0/2] Add reset_on_panic support for watchdog
Date: Thu, 22 May 2025 05:57:13 +0000
Message-ID: <20250522055715.3533356-1-george.cherian@marvell.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDA1NyBTYWx0ZWRfX+0Op0H0mDB1H 7PyYissHj+UF3enqkeDdjutyW4cIfVmi2Ddz9eyOU/EMqjNQDLRmAIiCGLbiYWdPvuYjHFT9CD2 OqNkq3X3xAnntdAf555ZmDnnZ2c4/J9sAoJcHjvieSLK+CPWwOD8fnpyqilR+VziZ7JMa8nXTvJ
 GHTD6nCmJsThK0iIsSU71bCtsDetYuySEMPjWlE9dpYMI0VTSQihVuCxd3puqTqPc8lrUez1i75 Dlxf+j0v6rFfleqz5sWGysU3dr/J4dLtwAQXjtsJdmoJuLr0l4284QP1JW3lJ6tz23kbrD1QC4W 9otAFwLsC205s6Xu2KJfI494JGkuAVyhiUlh8M/F8qy6UlzQnVmtH/nl3inVKbIrPxih4o0xlCc
 4t7cs6BiKGsqpGBpEHGTOj9T52UVDYtggm/L3Yft0oPpSZAp/NT74dMjsWox1UQ/U8/SX4m1
X-Proofpoint-GUID: pXbtxDdkaflOsMzeoDnzi_eC0qXLrqeB
X-Authority-Analysis: v=2.4 cv=T6OMT+KQ c=1 sm=1 tr=0 ts=682ebccc cx=c_pps a=rEv8fa4AjpPjGxpoe8rlIQ==:117 a=rEv8fa4AjpPjGxpoe8rlIQ==:17 a=dt9VzEwgFbYA:10 a=i_2PNuB7HiXbIVo88oEA:9
X-Proofpoint-ORIG-GUID: pXbtxDdkaflOsMzeoDnzi_eC0qXLrqeB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_03,2025-05-20_03,2025-03-28_01

This series adds a new option to watchdog core to reconfigure the
watchdog timeout on panic. This is useul in certain systems which prevents
successful loading of kdump kernel due to watchdog reset.

Some of the watchdog drivers ops could sleep. For such drivers the 
reset_on_panic is not valid as the notifier callback happens
in atomic context. Introduce WDIOF_OPS_ATOMIC flag to watchdog_info
options to indicate whether the stop/set_timeout function would sleep.


Changelog:
v1 -> v2
- Remove the per driver flag setting option
- Take the parameter via kernel command-line parameter to watchdog_core.

v2 -> v3
- Remove the helper function watchdog_stop_on_panic() from watchdog.h.
- There are no users for this. 

v3 -> v4
- Since the panic notifier is in atomic context, watchdog functions
  which sleep can't be called. 
- Add an options flag WDIOF_STOP_MAYSLEEP to indicate whether stop
  function sleeps.
- Simplify the stop_on_panic kernel command line parsing.
- Enable the panic notiffier only if the watchdog stop function doesn't
  sleep

v4 -> v5
- Remove the kernel command line option.
- Incorporate the suggestions by Ahamad Fatoum.
- Give an option to watchdog core to set the timeout in case of panic.
- This timeout is configurable runtime via sysfs.
- This way it addresses all the watchdogs as long as they have watchdog
  ops  atomic.
- Enable this feature to sbsa watchdog.

George Cherian (2):
  drivers: watchdog: Introduce watchdog reset timeout on panic
  drivers: sbsa_gwdt: Enable the reset_on_panic feature

 drivers/watchdog/sbsa_gwdt.c     |  3 +++
 drivers/watchdog/watchdog_core.c | 33 ++++++++++++++++++++++++++++++++
 drivers/watchdog/watchdog_dev.c  | 28 +++++++++++++++++++++++++++
 include/linux/watchdog.h         |  3 +++
 include/uapi/linux/watchdog.h    |  1 +
 5 files changed, 68 insertions(+)

-- 
2.34.1


