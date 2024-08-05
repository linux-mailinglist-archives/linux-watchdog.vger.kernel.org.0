Return-Path: <linux-watchdog+bounces-1448-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 15965947D15
	for <lists+linux-watchdog@lfdr.de>; Mon,  5 Aug 2024 16:44:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C5A8B285067
	for <lists+linux-watchdog@lfdr.de>; Mon,  5 Aug 2024 14:44:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 773BD13B5A0;
	Mon,  5 Aug 2024 14:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eqlOsPzT"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BA2013A3ED;
	Mon,  5 Aug 2024 14:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722869052; cv=none; b=jjrKrJii80wV+WKebjjAJPmdIODesVtwNVXR5VbPPERZmxdLVyoB1a6KXHvRa7+yrCz81G6Kj2OHrtBMl82h62+JD1u1yQoo7hVV3bAPMI77DRpyNMe106RaMH7GTPrcdIWrTxM1sitIxDonxHNwgopCKk7bWjmFgYDwP3B58I0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722869052; c=relaxed/simple;
	bh=W12Wh7xbfjM9EOTNhG4r+wxPWL8RxnMncVb0j7hZdk4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DxKA5SZETVimN5suhYnhHGYUd2EbG++x0XQFpf0qolAGW8SjBykHtt+Fz+MtJTc4UFuZcoX4NPdEjgkqumyCZPif6QU+9HVpf3EVR8m7XqiCWKUEfv2Zpo9SrA7D+cAYdKDnV21fwvxF/Udqwz8uLJklMOikCOsay/39MR2tPCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eqlOsPzT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE351C32782;
	Mon,  5 Aug 2024 14:44:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722869051;
	bh=W12Wh7xbfjM9EOTNhG4r+wxPWL8RxnMncVb0j7hZdk4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eqlOsPzTuESf+fsUF7NGWEPi/fyaNSU7JKHgmqyIxB3lQjJ1xkxD3kBDAjAu4JrRV
	 obmc15wTtzjyPzgUbpYaBqkdrFXie/JZNivC/Rz3tDhnJGI1QdS40yxqbiZfF905r9
	 R1jiBT6YrT9ZIV3q5fTtoMECAaxKjO+3nJngB3A0jD3VtfUm3B1uCBWVYovXTck7mg
	 dwOw79aiwlOrlgbLrCVTFOppaQOt2bah5uNYCjHdSFOvkYg9W48+fSeosd87PghKzF
	 tt+i1m5dKxpiNH4lwj5IYnZS0lfQAl0SRDz55AFYoGrMIaSQVr0WvPcP4IWq23wBEm
	 F+XNc/ppUUA7w==
Date: Mon, 5 Aug 2024 08:44:10 -0600
From: Rob Herring <robh@kernel.org>
To: Kousik Sanagavarapu <five231003@gmail.com>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org,
	linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/2] ti: davinci, keystone: txt to yaml
Message-ID: <20240805144410.GA2483419-robh@kernel.org>
References: <20240727050736.4756-1-five231003@gmail.com>
 <ZrB6Cbe6JBxFPRWn@five231003>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZrB6Cbe6JBxFPRWn@five231003>

On Mon, Aug 05, 2024 at 12:36:49PM +0530, Kousik Sanagavarapu wrote:
> On Sat, Jul 27, 2024 at 10:34:42AM +0530, Kousik Sanagavarapu wrote:
> > Convert txt bindings of DaVinci Timer and DaVinci/Keystone WDT
> > Controller to dtschema.
> > 
> > v3: https://lore.kernel.org/linux-devicetree/20240726150537.6873-1-five231003@gmail.com/
> > 
> > Changes since v3:
> > - No changes in 1/2.
> > - Explain why "power-domians" is needed in the commit msg and also add
> >   the Reviewed-by tag.
> 
> Ping incase this got lost in traffic

You can check the state in DT PW. It's still in my queue in case the 
timer and watchdog maintainers don't pick these up.

Note that these 2 patches are independent and go to different 
maintainers, so there was no need to make a series. No need to resend 
for that though.

Rob

