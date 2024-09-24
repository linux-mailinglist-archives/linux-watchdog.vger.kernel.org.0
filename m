Return-Path: <linux-watchdog+bounces-2020-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E1EA984816
	for <lists+linux-watchdog@lfdr.de>; Tue, 24 Sep 2024 16:56:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E0D84280F33
	for <lists+linux-watchdog@lfdr.de>; Tue, 24 Sep 2024 14:56:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77F591AAE2F;
	Tue, 24 Sep 2024 14:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="VSkOBwQY"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46A021A7254;
	Tue, 24 Sep 2024 14:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727189774; cv=none; b=C6U6F0IX+B0juUoOW1NCwrLYccDtEYjbGzd14+VaOqcIllU5C9Fj/9huZuY+07oy2B03jZuF5fAKlNR2u/0xXmWuRy3XGPVnTT6rw1CPs2AE/OFNzAgFRnONZmyxNC7hCl7iuj8dYFbc9WxGND/KNk2xOX9QYF+SCSjjrjJVP5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727189774; c=relaxed/simple;
	bh=BiTkDZFNxnw8hpzPzvwTIo35bstM7i6MkRzYSpffxMo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SZdJHkwj+zKhwDgWBROZk2v9FzwV3J3kczqly2YsfgRz8ZW1pvFujcAaCLNf9G1Z497Ou5P3Xdq80wuSe5dFvDc8H2pwhJQI3lHsEJuYMXQY7WETQ5f6HErAkz8EwVPC5d7wKbNJBrMOzz8tS+HRUFaaQkFRwn7KGpzn3BwSDsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=VSkOBwQY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E97BC4CEC4;
	Tue, 24 Sep 2024 14:56:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1727189773;
	bh=BiTkDZFNxnw8hpzPzvwTIo35bstM7i6MkRzYSpffxMo=;
	h=Date:From:To:Cc:Subject:From;
	b=VSkOBwQY2h00KcycEvlxW5Im2abduju9isbVHQ+JEOg7WhBs0AFRHS172zab1PkuV
	 dW6nfQPu6IyFM/gNbzPTa5MdY0JIVJt6F2KFUeEmGMNqdYWspw9diI5XwfEt8+zdFb
	 nPCF9uixyIlL42dOtnr2qG8UK4YTNDcDTLDNarl0=
Date: Tue, 24 Sep 2024 10:56:12 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Xing Tong Wu <xingtong_wu@163.com>, 
	Tobias Schaffner <tobias.schaffner@siemens.com>
Cc: linux-leds@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, helpdesk@kernel.org
Subject: Bouncing maintainers: Xing Tong Wu, Gerd Haeussler
Message-ID: <20240924-straight-rigorous-earthworm-f8f242@lemur>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hello:

I'm reaching out to co-maintainers of the following subsystems:

  - SIEMENS IPC LED DRIVERS
  - SIEMENS IPC PLATFORM DRIVERS
  - SIEMENS IPC WATCHDOG DRIVERS

The email address for several of your maintainers are bouncing:

  M: Xing Tong Wu <xingtong.wu@siemens.com>
  M: Gerd Haeussler <gerd.haeussler.ext@siemens.com>

There are several possible courses of action:

1. If you know the new email address for the maintainers, please ask them to
   submit a patch for MAINTAINERS and .mailmap files.

2. If these maintainer stepped away from their duties, or if co-maintainers are
   equally unable to reach them via any other means, please submit a patch to
   MAINTAINERS to remove their M: entries.

The goal is to have no bouncing M: entries in the maintainers file, so please
follow up as soon as you have decided on the correct course of action.

Best regards,
-- 
Konstantin Ryabitsev
Linux Foundation

bugspray track

