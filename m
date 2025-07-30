Return-Path: <linux-watchdog+bounces-3927-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B4A9B15F7E
	for <lists+linux-watchdog@lfdr.de>; Wed, 30 Jul 2025 13:32:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 46ACE7AA4D8
	for <lists+linux-watchdog@lfdr.de>; Wed, 30 Jul 2025 11:30:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2F512248B0;
	Wed, 30 Jul 2025 11:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AOyn+vN7"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 055E6DF49
	for <linux-watchdog@vger.kernel.org>; Wed, 30 Jul 2025 11:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753875099; cv=none; b=hmQwMkLzyo2l1434cLAQCG2iG73zAEuoo7sFTZmAEgK2q6OTCnqe1Uq2Ywe42RDRsTNj/a3LunngLIGwvOiemIn9yeiYOiYB7XIcsoJAuMBt2ricMAifmgBMEYdvuARhfoe9CdUKk/liOQFfmPjjwtPEpkFdxpKioeyTeS0N7Ls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753875099; c=relaxed/simple;
	bh=0SZUZe23mKDQcXZ67/xEL7RBhsJVDxUwjxymhctoI0U=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=qJDSUp1CZwUWGTrKVcYZScaYObumRyjwjXcorgUgTFmoPd5B10E8TP7R8tJ8Zc5r0LqiYq/2dA9k7TNViWCHhA624qLR5eLAVjwtUDR10cP+sIs9qlF/+yiwzsxf+/2FDZEcxFZppyR4PRZU/2wlBwc6SQok+5gd5sSYxEPfr4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AOyn+vN7; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-ae36dc91dc7so1135667066b.2
        for <linux-watchdog@vger.kernel.org>; Wed, 30 Jul 2025 04:31:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753875096; x=1754479896; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=0SZUZe23mKDQcXZ67/xEL7RBhsJVDxUwjxymhctoI0U=;
        b=AOyn+vN7wkas5EpWCn7WsAHxauRiRA+qSMbVWreWY3S+lGWJhCMMKYcs1aVoMpqOh/
         rX73FBCoGOrGGkKMZ21Nn3y62dGtMb1ytio/9X523vMgB7m84499MsDKNuHHeZExx/aV
         zR/TT/JJOX4dmHojQ6oFfdPWH/GwOaXNeOmW/fS2D9K89L+Vq5TCr2g/VK6KdXj8bzwC
         0bEd1qDBIaJGlS9MgzPoeIgX3557SFH4kBmNsUHIikpp1F9sc7iGMiQk5R9JrxTHkx3R
         h/QQ5Vo0aYTYwU2xAhkMbCPTPZHXmBejZlIIyUqJ7zinZaTUUz9Rr+a/7/h2i7qb54kY
         rQIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753875096; x=1754479896;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0SZUZe23mKDQcXZ67/xEL7RBhsJVDxUwjxymhctoI0U=;
        b=wo4OxalDVEkrBC8RZ9qSYvMTgcKDZIqiO+6h4IJq6qg7xFU8tTwm7keaQme42HqWTu
         cfKGwmtJ+uomefROFs7j/5UDdnZXg80tDYLXHsG5XtyuoY4G4p/VhSrJFkb9Xh4W+ZLM
         y04xigjz6Mdg8oxgJCXNu+Lffn0y1oYgoGMka2nw0DjgI3t11N2EKD0WrfkoQcPAT7Y1
         b5jgE9U/NjB+eNYROOSfPsvzyGyLff5WhYM+HVi6c2QBgy6ORvoF8cZS6zhtIjhI4VbI
         TSO+UBgRWiKV7mbayNlTYFniKWAWyL1Ru4z0cLYg60eyWOJw/XhtaO2ctiAfpbeuBzcG
         DzDw==
X-Gm-Message-State: AOJu0Yxv8N2KKODkfQB708J6B416TtLlFa0E7OJStJW7eae+GlCGklpV
	fofee1tp9LiT2EEa9RY1dZe6PFj+tNQgdZ4rENgZxHiesD2dyaR1LxxD5Bh+0mXo0M67tLld3gp
	bGVc16hD7VkCTeo0jx0iWI/ltwBFrKkJco8OR
X-Gm-Gg: ASbGncvnaw0HWElgrc30cdSWm5ubOGptbG/CVkbdR+x5o0K8VayZ53FHdHgWlEhQVsa
	daXI5ZkBJBQczprTW/4x19hqscvpBH1I6cMrj8NJRiBBtLJ/ICGT6neoZ5LXjMt3PhHakpjUp6C
	J9nDJDXe8Yyi2AXL7qG6F0LPdFy0CrZ9ESC4qC4wE6PU+e+oJJA1gurd7IHsMY8Khvk6CLpwUdN
	CXlkBkC7Xlpu3H7
X-Google-Smtp-Source: AGHT+IHiygV6HTCi+QnW8xO0PAydM+vE29XK8shvXVcrbW4pj7wAQJW2zg2FgQeJcBj4auEvzJWj5UQ3gL7/nJCzXI8=
X-Received: by 2002:a17:907:9720:b0:ae3:c6a3:f855 with SMTP id
 a640c23a62f3a-af8fd95cc19mr372639266b.31.1753875095695; Wed, 30 Jul 2025
 04:31:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Srecko Prokic <prokicsrecko6@gmail.com>
Date: Wed, 30 Jul 2025 13:31:24 +0200
X-Gm-Features: Ac12FXxNC0zt8CrpZ7hiH5lYCDm9979vbpyxG_0I-iOVSEHCfnJpjY7i1F8xDj0
Message-ID: <CACiZu+C2AysG9GrT_nvm9Gm2diqvoCmRxh1cD9OsgeVMpTnmUg@mail.gmail.com>
Subject: NETDEV WATCHDOG + transmit queue timed out
To: linux-watchdog@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello all,

This is the issue I am experiencing,
When I try to use network interface end0 on kernel version 6.14 for
Rockchip RK3588 SoC, I get this in dmesg:

"rk_gmac-dwmac fe1c0000.ethernet end0: NETDEV WATCHDOG: CPU: 1: transmit
queue 1 timed out 5408 ms"

dmesg:
rk_gmac-dwmac fe1c0000.ethernet end0: Link is Up - 10Mbps/Half - flow
control off
rk_gmac-dwmac fe1c0000.ethernet end0: NETDEV WATCHDOG: CPU: 2: transmit
queue 1 timed out 5388 ms
rk_gmac-dwmac fe1c0000.ethernet end0: Reset adapter.
rk_gmac-dwmac fe1c0000.ethernet end0: Timeout accessing MAC_VLAN_Tag_Filter
rk_gmac-dwmac fe1c0000.ethernet end0: failed to kill vid 0081/0
rk_gmac-dwmac fe1c0000.ethernet end0: Register MEM_TYPE_PAGE_POOL RxQ-0
rk_gmac-dwmac fe1c0000.ethernet end0: Register MEM_TYPE_PAGE_POOL RxQ-1
rk_gmac-dwmac fe1c0000.ethernet end0: PHY [stmmac-0:01] driver [RTL8211F
Gigabit Ethernet] (irq=POLL)
dwmac4: Master AXI performs any burst length
rk_gmac-dwmac fe1c0000.ethernet end0: No Safety Features support found
rk_gmac-dwmac fe1c0000.ethernet end0: IEEE 1588-2008 Advanced Timestamp
supported
rk_gmac-dwmac fe1c0000.ethernet end0: registered PTP clock
rk_gmac-dwmac fe1c0000.ethernet end0: configuring for phy/rgmii link mode
8021q: adding VLAN 0 to HW filter on device end0
rk_gmac-dwmac fe1c0000.ethernet end0: Link is Up - 10Mbps/Half - flow
control off

phy controller: realtek rtl8211f
soc: RK3588

I tried to disable the TSO feature, but that did not work-same result.
Also, I am pretty sure that the Device Tree config is okay, I tried
the same DT config on the 5.10 kernel version and the network
interface worked without issue.

Did anyone have this kind of issue? Some hints how to fix it or some
reference patch?

Thanks all

