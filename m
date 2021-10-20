Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 86356434A0E
	for <lists+linux-watchdog@lfdr.de>; Wed, 20 Oct 2021 13:29:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230190AbhJTLbP (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 20 Oct 2021 07:31:15 -0400
Received: from mail.kernel.org ([198.145.29.99]:53562 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230139AbhJTLbN (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 20 Oct 2021 07:31:13 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1750C6136A;
        Wed, 20 Oct 2021 11:28:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634729339;
        bh=FfhgtDYVyNHCcHSEhOy5i16MCYOtKPZkE4GgwNgqH4I=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=V18vCLG8eYUjC6wP+1kve4j0OvK7oPHCXlPTcEFbt0TwJUXxOx2ttRODk8SkSCmU+
         ev9FLt86+pmC+Wmn4bQCUfWimiALBfslgerkEGvzVHQxKY/lGVFmTrPmuU0eOBjzwH
         UB+KwyxqrF0okF1bk2gB6EH+xLOboGU9/LaoMRho4hI/TwO1IC46Aq+qzX1e9xqqwJ
         lx8IF48Io9Fv47cpasakx6tqAIb++4lARZzrXHtT0riYwEhZrtWrUjUYlsfi8/jqcd
         8gnMCwapd7T5jt11EffJDjMZDn91igwWGBNYBBuK0l9C8RIp3dq6sBTsstY8T8NjD2
         bdaV/9siMlIdA==
From:   Mark Brown <broonie@kernel.org>
To:     robh+dt@kernel.org, Tzung-Bi Shih <tzungbi@google.com>,
        matthias.bgg@gmail.com
Cc:     Mark Brown <broonie@kernel.org>,
        linux-mediatek@lists.infradead.org, alsa-devel@alsa-project.org,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        enric.balletbo@collabora.com
Subject: Re: [PATCH] ASoC: dt-bindings: mediatek: rename reset controller headers in DT example
Date:   Wed, 20 Oct 2021 12:28:39 +0100
Message-Id: <163472931364.2896549.9580992240702562423.b4-ty@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211018101608.3818840-1-tzungbi@google.com>
References: <20211018101608.3818840-1-tzungbi@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Mon, 18 Oct 2021 18:16:08 +0800, Tzung-Bi Shih wrote:
> Commit f07c776f6d7e ("arm64: dts: mediatek: Move reset controller
> constants into common location") moves the reset controller headers.
> However, it forgot to rename the DT example in mt8192-afe-pcm.yaml.
> 
> Renames the DT example to pass dt_binding_check.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: dt-bindings: mediatek: rename reset controller headers in DT example
      commit: a2b5c48abd485b289d3502466a9e8e1785f5adf3

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark
