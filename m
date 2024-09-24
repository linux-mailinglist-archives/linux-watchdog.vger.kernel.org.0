Return-Path: <linux-watchdog+bounces-2023-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C85D0984C28
	for <lists+linux-watchdog@lfdr.de>; Tue, 24 Sep 2024 22:27:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E01ED1C20DCD
	for <lists+linux-watchdog@lfdr.de>; Tue, 24 Sep 2024 20:27:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18E0C12EBE1;
	Tue, 24 Sep 2024 20:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="xSoja92b"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1800126C0D
	for <linux-watchdog@vger.kernel.org>; Tue, 24 Sep 2024 20:27:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727209666; cv=none; b=VIoDKcCPMBR4WP2Tv3VgsCdWd5wthvsoNClrLOBEic44Giuy+jkSw0iTDKhAqo7aWYRP/hgjcLE48f9lDgxYRjSfDl1wp48Mgi6WjwFYyhN4xLTKfnjTdOH4kJ+IUvUx+voxFIh94+TWgkoXE4uxKPJxr/c/2xzzXbWx46c+CHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727209666; c=relaxed/simple;
	bh=VljRXtH6v5nKEBz/Din/qrDjXDT+IXEKCTw2S6oSevU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=USstKV+v1FTIorTfAj8UGTFkAz2jq2zU4saJ6sOa5lJe8m4jpM6SfH3VeF3th4JZeg6JtqMNhf2QnW9HIKLk5dEM2I4ENbeNfldOvSnEeDZ3K1hBnTiIETY8HjsJSDLTVnGRtYen0GxsCoSmmdYZ/mfeW/s9iFRvlZU7MxAUX1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=xSoja92b; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DE84C4CEC6;
	Tue, 24 Sep 2024 20:27:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1727209665;
	bh=VljRXtH6v5nKEBz/Din/qrDjXDT+IXEKCTw2S6oSevU=;
	h=Date:From:To:Cc:Subject:From;
	b=xSoja92bi/Z0MlMg91JXinsN77lX6WHS09mmVktJISXbigLWV+ezyFf+a+7yQin9M
	 /E0yiOUGe6l3BuHfEZMTuQ69fz8up8vYgTnXJSq8smgHxtL02mioBb+G9zDkFfj/Ct
	 jWfQjh11mRBl6rvVcANghAQA/Gac/TFrXZvWhPsg=
Date: Tue, 24 Sep 2024 16:27:40 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Xingyu Wu <xingyu.wu@starfivetech.com>
Cc: linux-watchdog@vger.kernel.org, helpdesk@kernel.org
Subject: Bouncing maintainer: Samin Guo
Message-ID: <20240924-remarkable-rebel-dingo-25c95e@lemur>
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

  - STARFIVE WATCHDOG DRIVER

The email address for one of your maintainers is bouncing:

  M: Samin Guo <samin.guo@starfivetech.com>

There are several possible courses of action:

1. If you know the new email address for the maintainer, please ask them to
   submit a patch for MAINTAINERS and .mailmap files.

2. If this maintainer stepped away from their duties, or if co-maintainers are
   equally unable to reach them via any other means, please submit a patch to
   MAINTAINERS to remove their M: entry.

The goal is to have no bouncing M: entries in the maintainers file, so please
follow up as soon as you have decided on the correct course of action.

Best regards,
--
Konstantin Ryabitsev
Linux Foundation

bugspray track

