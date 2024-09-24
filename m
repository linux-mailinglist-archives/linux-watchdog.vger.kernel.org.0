Return-Path: <linux-watchdog+bounces-2022-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 76371984BDF
	for <lists+linux-watchdog@lfdr.de>; Tue, 24 Sep 2024 22:00:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 91FA31C22979
	for <lists+linux-watchdog@lfdr.de>; Tue, 24 Sep 2024 20:00:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47FB012D773;
	Tue, 24 Sep 2024 20:00:08 +0000 (UTC)
X-Original-To: linux-watchdog@vger.kernel.org
Received: from bmailout3.hostsharing.net (bmailout3.hostsharing.net [176.9.242.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD8DF13B2BB;
	Tue, 24 Sep 2024 20:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=176.9.242.62
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727208008; cv=none; b=iktehUWFJdyesHOfkobpRUBki1s7oXeb9IbaTZn+aPoDVGr516Z/Bm+0qP3FjrUX331wPyfgNKJ0obMPVVqwXo1ZNhipGrPmscFLl3aJqk2DPfMv/sP8eIsrHOznnxmoHNpG2ZI9EtP3rFoQ7l1Asz6pyPJYfH+NtIdXM10HpcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727208008; c=relaxed/simple;
	bh=9hKhFyVM4E8u4KeWbEylTGZvzQ0rrdD7T4ymUGZPV64=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UxCcx7eJlXNfk7088+Vy138pVJDq3nFGeBStZ3rvhnrnnkcJKGvrGr826vhGTecHGYJyo/pkU5vQVnUhlWGaM6oW12qy13jOAHuGmVQBPD/96jgirM8kATe2sWzIpM/ZY/LtnWIQi1/2G8rGq53E0eCdNNPAJTpyCy3FbzYy4VA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de; spf=none smtp.mailfrom=h08.hostsharing.net; arc=none smtp.client-ip=176.9.242.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=h08.hostsharing.net
Received: from h08.hostsharing.net (h08.hostsharing.net [83.223.95.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "*.hostsharing.net", Issuer "RapidSSL TLS RSA CA G1" (verified OK))
	by bmailout3.hostsharing.net (Postfix) with ESMTPS id 86B6E100DA1C6;
	Tue, 24 Sep 2024 22:00:01 +0200 (CEST)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id 3A5E35931A1; Tue, 24 Sep 2024 22:00:01 +0200 (CEST)
Date: Tue, 24 Sep 2024 22:00:01 +0200
From: Lukas Wunner <lukas@wunner.de>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Baocheng Su <baocheng.su@siemens.com>,
	Felix Moessbauer <felix.moessbauer@siemens.com>,
	Christian Storm <christian.storm@siemens.com>,
	Quirin Gylstorff <quirin.gylstorff@siemens.com>,
	Chao Zeng <chao.zeng@siemens.com>
Cc: Xing Tong Wu <xingtong_wu@163.com>,
	Tobias Schaffner <tobias.schaffner@siemens.com>,
	linux-leds@vger.kernel.org, platform-driver-x86@vger.kernel.org,
	linux-watchdog@vger.kernel.org, helpdesk@kernel.org
Subject: Re: Bouncing maintainers: Xing Tong Wu, Gerd Haeussler
Message-ID: <ZvMaQcTHXaUDBO3U@wunner.de>
References: <20240924-straight-rigorous-earthworm-f8f242@lemur>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240924-straight-rigorous-earthworm-f8f242@lemur>

[to += Jan Kiszka and other Siemens folks]

On Tue, Sep 24, 2024 at 10:56:12AM -0400, Konstantin Ryabitsev wrote:
> Hello:
> 
> I'm reaching out to co-maintainers of the following subsystems:
> 
>   - SIEMENS IPC LED DRIVERS
>   - SIEMENS IPC PLATFORM DRIVERS
>   - SIEMENS IPC WATCHDOG DRIVERS
> 
> The email address for several of your maintainers are bouncing:
> 
>   M: Xing Tong Wu <xingtong.wu@siemens.com>
>   M: Gerd Haeussler <gerd.haeussler.ext@siemens.com>
> 
> There are several possible courses of action:
> 
> 1. If you know the new email address for the maintainers, please ask them to
>    submit a patch for MAINTAINERS and .mailmap files.
> 
> 2. If these maintainer stepped away from their duties, or if co-maintainers are
>    equally unable to reach them via any other means, please submit a patch to
>    MAINTAINERS to remove their M: entries.
> 
> The goal is to have no bouncing M: entries in the maintainers file, so please
> follow up as soon as you have decided on the correct course of action.
> 
> Best regards,
> -- 
> Konstantin Ryabitsev
> Linux Foundation
> 
> bugspray track

