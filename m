Return-Path: <linux-watchdog+bounces-2563-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B0629EFC05
	for <lists+linux-watchdog@lfdr.de>; Thu, 12 Dec 2024 20:06:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 71F4016BE56
	for <lists+linux-watchdog@lfdr.de>; Thu, 12 Dec 2024 19:06:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 802DC189BBB;
	Thu, 12 Dec 2024 19:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qaXrBdB9"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5533E188722;
	Thu, 12 Dec 2024 19:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734030376; cv=none; b=QUe0Nceaop0GKN4wZO4UEHm/ZfhfmWxYXTOjn70yiBFqoDPbfIB6i13DqlBvCV/JuCZCd2NYSNouqV/HH1PmNfsDg5xnzl62J+h/rRJ715D6qeaIMS8jCQopiQBzWX6/m7oJMRV9VHg1Oj2uJ8zJLAtAOXWtHixGIZnr8rbY+VE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734030376; c=relaxed/simple;
	bh=VxgHNwFmaWCtepqB0u6AhFEsWJxOKzUcRPRFx3Fkmxk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=fb4asm43+0kjFxMXvealTQh7tfuyW3J8fE6YTVKZEPH9oY5vfKPSO4ppk8VPIPMx9l+PNXXqCNoPHlg3oYEONVka+mN1IZ+kIGyZQ8uIg53aC+sfuz3LoyArFTng8cc3x2Q/rXZqRDqgjO62jdlfYMOssCALozfhrnkf94GzhSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qaXrBdB9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82159C4CECE;
	Thu, 12 Dec 2024 19:06:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734030375;
	bh=VxgHNwFmaWCtepqB0u6AhFEsWJxOKzUcRPRFx3Fkmxk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=qaXrBdB9Q3HYnEM6YOOACHhwetUkuf2VImHN0U4aHtkLuzqdTIhFK5eFdG0TdlTdS
	 862u4O1l/Bvwpc5Do3LJTNyFPNqoaiDrLUqP+7rbsQVAa7ZipvXeY89E0jHjhiTZiA
	 2WF6Xn5JeCaMLVFTGqMXrTP44JWLjHQJMndHkyZKshla097WDwQowMn1sT6VPUB/w3
	 wvVdTZWPi0LwKHTZj4l2DNabNxZwOhVc0bFUA3WrUAY7qcaqgwjCKTo1MeP33UpmYi
	 bGh05dLcXB7lv9szDrMhw9qQNqkEva+QmsPnwdK39ifw9IPuPfriusSId9jKUJc77v
	 x+Yvb+FeRjkWg==
From: Lee Jones <lee@kernel.org>
To: Support Opensource <support.opensource@diasemi.com>, 
 Lee Jones <lee@kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, 
 Marcus Folkesson <marcus.folkesson@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org
In-Reply-To: <20241210-da9052-wdt-v2-1-95a5756e9ac8@gmail.com>
References: <20241210-da9052-wdt-v2-0-95a5756e9ac8@gmail.com>
 <20241210-da9052-wdt-v2-1-95a5756e9ac8@gmail.com>
Subject: Re: (subset) [PATCH v2 1/2] mfd: da9052: store result from
 fault_log
Message-Id: <173403037427.2377570.11343478504367875652.b4-ty@kernel.org>
Date: Thu, 12 Dec 2024 19:06:14 +0000
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0

On Tue, 10 Dec 2024 16:24:40 +0100, Marcus Folkesson wrote:
> Other sub-components (da9052-wdt) could use the result to determine
> reboot cause.
> Expose the result by make it part of the da9052 structure.
> 
> 

Applied, thanks!

[1/2] mfd: da9052: store result from fault_log
      commit: 2873c48377e5d68aebdbb3b6a6c191fda321ddbf

--
Lee Jones [李琼斯]


